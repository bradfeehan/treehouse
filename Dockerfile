# syntax=docker/dockerfile:1.4
ARG DEBIAN_RELEASE=bookworm

########################################
## ruby: The upstream ruby base image
########################################
FROM ruby:3.3-slim-bookworm@sha256:763422273a15e307b044fcb3ad6b1ef6c290d2043ac73596842aba5659dc7318 as ruby

########################################
## base: Our base with Ruby, Node, etc.
########################################
FROM ruby AS base
LABEL maintainer="Brad Feehan <git@bradfeehan.com>"

ARG BUNDLE_JOBS
ARG DEBIAN_RELEASE
ARG POSTGRESQL_KEYRING='/usr/share/keyrings/postgresql.gpg'

ENV \
  BUNDLE_JOBS="${BUNDLE_JOBS:-32}" \
  BUNDLE_SILENCE_ROOT_WARNING=''

SHELL ["/bin/bash", "-euo", "pipefail", "-c"]

WORKDIR /app

# Configure APT to maintain its cache in a mount outside the container
RUN rm -f /etc/apt/apt.conf.d/docker-clean \
  && echo 'Binary::apt::APT::Keep-Downloaded-Packages "true";' \
    > /etc/apt/apt.conf.d/keep-cache

COPY ./vendor/keys /usr/share/keys

RUN --mount=type=cache,target=/var/cache/apt --mount=type=cache,target=/var/lib/apt/lists \
  apt-get update --quiet \
  && DEBIAN_FRONTEND=noninteractive apt-get install --assume-yes --quiet --no-install-recommends \
    gnupg='2.*' \
  && gpg --dearmor --output "${POSTGRESQL_KEYRING}" < /usr/share/keys/postgresql.gpg.asc \
  && gpg --no-default-keyring --keyring "${POSTGRESQL_KEYRING}" --list-keys \
  && printf '%s\n' \
    "deb [signed-by=${POSTGRESQL_KEYRING}] http://apt.postgresql.org/pub/repos/apt ${DEBIAN_RELEASE}-pgdg main" \
    > /etc/apt/sources.list.d/postgresql.list \
  && apt-get remove --autoremove --purge --assume-yes --quiet \
    gnupg \
  && rm -rf \
    /var/log/*.log \
    /var/log/apt/*.log

RUN --mount=type=cache,target=/var/cache/apt --mount=type=cache,target=/var/lib/apt/lists \
  apt-get update --quiet \
  && DEBIAN_FRONTEND=noninteractive apt-get install --assume-yes --quiet --no-install-recommends \
    libpq-dev='16.*' \
    postgresql-client-16='16.*' \
  && gem update --system \
  && if [[ -d '/usr/local/bundle/cache' ]]; then find '/usr/local/bundle/cache' -name '*.gem' -delete; fi \
  && rm -rf /root/.local/share/gem/specs \
  && apt-get remove --autoremove --purge --assume-yes --quiet \
    perl \
  && rm -rf \
    /var/log/*.log \
    /var/log/apt/*.log

RUN mkdir -p '/app/vendor/cache' \
  && groupadd --gid 1000 ruby \
  && useradd --uid 1000 --gid ruby --shell /bin/bash --create-home ruby \
  && chown -R ruby:ruby '/app' "${GEM_HOME}" \
  && chmod u+rwX,go+rX-w '/app' "${GEM_HOME}"

USER ruby


########################################
## rubygems: Install Ruby dependencies
########################################
FROM base as rubygems
SHELL ["/bin/bash", "-euo", "pipefail", "-c"]

USER root
RUN --mount=type=cache,target=/var/cache/apt --mount=type=cache,target=/var/lib/apt/lists \
  apt-get update --quiet \
  && DEBIAN_FRONTEND=noninteractive apt-get install --assume-yes --quiet --no-install-recommends \
    build-essential='12.*'

USER ruby
COPY --chown=ruby:ruby .ruby-version ./
COPY --chown=ruby:ruby Gemfile* ./
COPY --chown=ruby:ruby vendor/cache/*.gem ./vendor/cache/

RUN bundle install --local --verbose \
  && find '/usr/local/bundle/cache' -name '*.gem' -delete


########################################
## app: Contains only app code at /app
########################################
FROM ruby AS app
SHELL ["/bin/bash", "-euo", "pipefail", "-c"]

WORKDIR /app

COPY . ./
RUN find /app -name '*.gem' -delete


########################################
## production: Final complete image
########################################
FROM base AS production
SHELL ["/bin/bash", "-euo", "pipefail", "-c"]

COPY --from=rubygems "${GEM_HOME}" "${GEM_HOME}"
COPY --from=app --chown=ruby:ruby /app /app

EXPOSE 3000/tcp

CMD ["/bin/bash"]

########################################
## development: Extras for development
########################################
FROM production AS development

USER root

RUN --mount=type=cache,target=/var/cache/apt --mount=type=cache,target=/var/lib/apt/lists \
  apt-get update --quiet \
  && DEBIAN_FRONTEND=noninteractive apt-get install --assume-yes --quiet --no-install-recommends \
    build-essential='12.*' \
    curl='7.*' \
    git='1:2.*' \
    perl='5.*'

USER ruby

CMD ["/bin/bash"]


########################################
## Make production the default target
########################################
FROM production AS default

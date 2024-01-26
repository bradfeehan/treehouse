# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `FetchQueryJob`.
# Please instead update this file by running `bin/tapioca dsl FetchQueryJob`.

class FetchQueryJob
  class << self
    sig do
      params(
        query: T.untyped,
        block: T.nilable(T.proc.params(job: FetchQueryJob).void)
      ).returns(T.any(FetchQueryJob, FalseClass))
    end
    def perform_later(query:, &block); end

    sig { params(query: T.untyped).returns(T.untyped) }
    def perform_now(query:); end
  end
end

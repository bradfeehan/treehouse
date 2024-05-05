# typed: strict
# frozen_string_literal: true

# Presentation logic for Address model
module PriceDecorator
  extend T::Helpers
  extend T::Sig

  requires_ancestor { ActionView::Helpers }
  requires_ancestor { Price }

  sig { returns(String) }
  def to_fs
    format_best(value, min, max) || parse_display || display || '[no price]'
  end

  alias to_formatted_s to_fs
  alias to_s to_fs

  private

  PARSERS = T.let(
    {
      # Parse a simple value from a string
      %r{
        \A \s* \$? \s*                   # String optionally starts with whitespace and a dollar sign
        (?<value> \d+)(?:.00)? \s*       # First sequence of numbers is considered the value
        (?:pe?r?)?           \s* /? \s*  # allow p, pr, per, a slash, or combination
        (?:wk?|week|weekly)? \s* /? \s*  # allow w, wk, week, weekly, a slash, or combination
        (?:                              # allows for an additional per-month value that is ignored
          \$? \s*                        # ...consisting of an optional dollar sign and whitespace
          \d+(?:.00)? \s*                # then a number
          (?:pe?r?/?)? \s*               # this allows p, per, slash, etc.
          (?:c(?:alendar)?)? \s*         # optional c or calendar
          (?:mo?n?t?h?) \s*              # optional m, mo, mon, month, etc.
        )? \s* \z                        # ignore whitespace at the end
      }xi => proc { |m| [Integer(m[:value]), nil, nil] },

      # Parse a range between a lower and upper bound
      %r{
        \A \s* \$? \s*                   # String optionally starts with whitespace and a dollar sign
        (?<min> \d+)(?:.00)? \s*         # First sequence of numbers is considered the lower bound
        -+ \s* \$? \s*                   # A hyphen separates the lower and upper bounds
        (?<max> \d+)(?:.00)? \s*         # Second sequence of numbers is considered the upper bound
        (?:pe?r?)?           \s* /? \s*  # allow p, pr, per, a slash, or combination
        (?:wk?|week|weekly)? \s* /? \s*  # allow w, wk, week, weekly, a slash, or combination
        \z
      }xi => proc { |m| [nil, Integer(m[:min]), Integer(m[:max])] },
    }.freeze,
    T::Hash[
      Regexp,
      T.proc.params(match: MatchData).returns([T.nilable(Numeric), T.nilable(Numeric), T.nilable(Numeric)])
    ],
  )

  private_constant :PARSERS

  sig { params(value: T.nilable(Numeric), min: T.nilable(Numeric), max: T.nilable(Numeric)).returns(T.nilable(String)) }
  def format_best(value, min, max)
    format_range(min, max) || format_single(value) || format_min(min) || format_max(max)
  end

  sig { params(value: T.nilable(Numeric)).returns(T.nilable(String)) }
  def format_single(value)
    currency(value) if value.present?
  end

  sig { params(min: T.nilable(Numeric), max: T.nilable(Numeric)).returns(T.nilable(String)) }
  def format_range(min, max)
    "#{currency(min)}–#{currency(max)}" if min.present? && max.present? && min != max
  end

  sig { params(min: T.nilable(Numeric)).returns(T.nilable(String)) }
  def format_min(min)
    "From #{currency(min)}" if min.present?
  end

  sig { params(max: T.nilable(Numeric)).returns(T.nilable(String)) }
  def format_max(max)
    "Under #{currency(max)}" if max.present?
  end

  sig { params(value: Numeric).returns(T.nilable(String)) }
  def currency(value)
    number_to_currency(value, precision: 0) if value.present?
  end

  sig { returns(T.nilable(String)) }
  def parse_display
    parser_chain = parsers.each.lazy.filter_map do |pattern, parser|
      matchdata = display&.match(pattern)
      parser.call(matchdata) if matchdata
    end

    tuple = parser_chain.first
    format_best(tuple[0], tuple[1], tuple[2]) if tuple
  end

  sig do
    returns(
      T::Hash[
        Regexp,
        T.proc.params(match: MatchData).returns([T.nilable(Numeric), T.nilable(Numeric), T.nilable(Numeric)])
      ],
    )
  end
  def parsers
    PARSERS
  end
end

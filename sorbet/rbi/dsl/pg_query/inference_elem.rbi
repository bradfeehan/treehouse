# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `PgQuery::InferenceElem`.
# Please instead update this file by running `bin/tapioca dsl PgQuery::InferenceElem`.

class PgQuery::InferenceElem
  sig do
    params(
      expr: T.nilable(PgQuery::Node),
      infercollid: T.nilable(Integer),
      inferopclass: T.nilable(Integer),
      xpr: T.nilable(PgQuery::Node)
    ).void
  end
  def initialize(expr: nil, infercollid: nil, inferopclass: nil, xpr: nil); end

  sig { void }
  def clear_expr; end

  sig { void }
  def clear_infercollid; end

  sig { void }
  def clear_inferopclass; end

  sig { void }
  def clear_xpr; end

  sig { returns(T.nilable(PgQuery::Node)) }
  def expr; end

  sig { params(value: T.nilable(PgQuery::Node)).void }
  def expr=(value); end

  sig { returns(Integer) }
  def infercollid; end

  sig { params(value: Integer).void }
  def infercollid=(value); end

  sig { returns(Integer) }
  def inferopclass; end

  sig { params(value: Integer).void }
  def inferopclass=(value); end

  sig { returns(T.nilable(PgQuery::Node)) }
  def xpr; end

  sig { params(value: T.nilable(PgQuery::Node)).void }
  def xpr=(value); end
end

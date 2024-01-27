# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `PgQuery::A_Const`.
# Please instead update this file by running `bin/tapioca dsl PgQuery::A_Const`.

class PgQuery::A_Const
  sig do
    params(
      boolval: T.nilable(PgQuery::Boolean),
      bsval: T.nilable(PgQuery::BitString),
      fval: T.nilable(PgQuery::Float),
      isnull: T.nilable(T::Boolean),
      ival: T.nilable(PgQuery::Integer),
      location: T.nilable(Integer),
      sval: T.nilable(PgQuery::String)
    ).void
  end
  def initialize(boolval: nil, bsval: nil, fval: nil, isnull: nil, ival: nil, location: nil, sval: nil); end

  sig { returns(T.nilable(PgQuery::Boolean)) }
  def boolval; end

  sig { params(value: T.nilable(PgQuery::Boolean)).void }
  def boolval=(value); end

  sig { returns(T.nilable(PgQuery::BitString)) }
  def bsval; end

  sig { params(value: T.nilable(PgQuery::BitString)).void }
  def bsval=(value); end

  sig { void }
  def clear_boolval; end

  sig { void }
  def clear_bsval; end

  sig { void }
  def clear_fval; end

  sig { void }
  def clear_isnull; end

  sig { void }
  def clear_ival; end

  sig { void }
  def clear_location; end

  sig { void }
  def clear_sval; end

  sig { returns(T.nilable(PgQuery::Float)) }
  def fval; end

  sig { params(value: T.nilable(PgQuery::Float)).void }
  def fval=(value); end

  sig { returns(T::Boolean) }
  def isnull; end

  sig { params(value: T::Boolean).void }
  def isnull=(value); end

  sig { returns(T.nilable(PgQuery::Integer)) }
  def ival; end

  sig { params(value: T.nilable(PgQuery::Integer)).void }
  def ival=(value); end

  sig { returns(Integer) }
  def location; end

  sig { params(value: Integer).void }
  def location=(value); end

  sig { returns(T.nilable(PgQuery::String)) }
  def sval; end

  sig { params(value: T.nilable(PgQuery::String)).void }
  def sval=(value); end

  sig { returns(T.nilable(Symbol)) }
  def val; end
end

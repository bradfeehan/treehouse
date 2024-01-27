# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `PgQuery::JsonArrayConstructor`.
# Please instead update this file by running `bin/tapioca dsl PgQuery::JsonArrayConstructor`.

class PgQuery::JsonArrayConstructor
  sig do
    params(
      absent_on_null: T.nilable(T::Boolean),
      exprs: T.nilable(T.any(Google::Protobuf::RepeatedField[PgQuery::Node], T::Array[PgQuery::Node])),
      location: T.nilable(Integer),
      output: T.nilable(PgQuery::JsonOutput)
    ).void
  end
  def initialize(absent_on_null: nil, exprs: T.unsafe(nil), location: nil, output: nil); end

  sig { returns(T::Boolean) }
  def absent_on_null; end

  sig { params(value: T::Boolean).void }
  def absent_on_null=(value); end

  sig { void }
  def clear_absent_on_null; end

  sig { void }
  def clear_exprs; end

  sig { void }
  def clear_location; end

  sig { void }
  def clear_output; end

  sig { returns(Google::Protobuf::RepeatedField[PgQuery::Node]) }
  def exprs; end

  sig { params(value: Google::Protobuf::RepeatedField[PgQuery::Node]).void }
  def exprs=(value); end

  sig { returns(Integer) }
  def location; end

  sig { params(value: Integer).void }
  def location=(value); end

  sig { returns(T.nilable(PgQuery::JsonOutput)) }
  def output; end

  sig { params(value: T.nilable(PgQuery::JsonOutput)).void }
  def output=(value); end
end

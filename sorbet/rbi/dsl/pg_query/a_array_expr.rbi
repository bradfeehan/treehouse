# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `PgQuery::A_ArrayExpr`.
# Please instead update this file by running `bin/tapioca dsl PgQuery::A_ArrayExpr`.

class PgQuery::A_ArrayExpr
  sig do
    params(
      elements: T.nilable(T.any(Google::Protobuf::RepeatedField[PgQuery::Node], T::Array[PgQuery::Node])),
      location: T.nilable(Integer)
    ).void
  end
  def initialize(elements: T.unsafe(nil), location: nil); end

  sig { void }
  def clear_elements; end

  sig { void }
  def clear_location; end

  sig { returns(Google::Protobuf::RepeatedField[PgQuery::Node]) }
  def elements; end

  sig { params(value: Google::Protobuf::RepeatedField[PgQuery::Node]).void }
  def elements=(value); end

  sig { returns(Integer) }
  def location; end

  sig { params(value: Integer).void }
  def location=(value); end
end

# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `PgQuery::ResTarget`.
# Please instead update this file by running `bin/tapioca dsl PgQuery::ResTarget`.

class PgQuery::ResTarget
  sig do
    params(
      indirection: T.nilable(T.any(Google::Protobuf::RepeatedField[PgQuery::Node], T::Array[PgQuery::Node])),
      location: T.nilable(Integer),
      name: T.nilable(String),
      val: T.nilable(PgQuery::Node)
    ).void
  end
  def initialize(indirection: T.unsafe(nil), location: nil, name: nil, val: nil); end

  sig { void }
  def clear_indirection; end

  sig { void }
  def clear_location; end

  sig { void }
  def clear_name; end

  sig { void }
  def clear_val; end

  sig { returns(Google::Protobuf::RepeatedField[PgQuery::Node]) }
  def indirection; end

  sig { params(value: Google::Protobuf::RepeatedField[PgQuery::Node]).void }
  def indirection=(value); end

  sig { returns(Integer) }
  def location; end

  sig { params(value: Integer).void }
  def location=(value); end

  sig { returns(String) }
  def name; end

  sig { params(value: String).void }
  def name=(value); end

  sig { returns(T.nilable(PgQuery::Node)) }
  def val; end

  sig { params(value: T.nilable(PgQuery::Node)).void }
  def val=(value); end
end

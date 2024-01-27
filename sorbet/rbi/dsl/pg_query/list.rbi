# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `PgQuery::List`.
# Please instead update this file by running `bin/tapioca dsl PgQuery::List`.

class PgQuery::List
  sig { params(items: T.nilable(T.any(Google::Protobuf::RepeatedField[PgQuery::Node], T::Array[PgQuery::Node]))).void }
  def initialize(items: T.unsafe(nil)); end

  sig { void }
  def clear_items; end

  sig { returns(Google::Protobuf::RepeatedField[PgQuery::Node]) }
  def items; end

  sig { params(value: Google::Protobuf::RepeatedField[PgQuery::Node]).void }
  def items=(value); end
end

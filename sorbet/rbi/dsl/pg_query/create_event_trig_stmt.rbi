# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `PgQuery::CreateEventTrigStmt`.
# Please instead update this file by running `bin/tapioca dsl PgQuery::CreateEventTrigStmt`.

class PgQuery::CreateEventTrigStmt
  sig do
    params(
      eventname: T.nilable(String),
      funcname: T.nilable(T.any(Google::Protobuf::RepeatedField[PgQuery::Node], T::Array[PgQuery::Node])),
      trigname: T.nilable(String),
      whenclause: T.nilable(T.any(Google::Protobuf::RepeatedField[PgQuery::Node], T::Array[PgQuery::Node]))
    ).void
  end
  def initialize(eventname: nil, funcname: T.unsafe(nil), trigname: nil, whenclause: T.unsafe(nil)); end

  sig { void }
  def clear_eventname; end

  sig { void }
  def clear_funcname; end

  sig { void }
  def clear_trigname; end

  sig { void }
  def clear_whenclause; end

  sig { returns(String) }
  def eventname; end

  sig { params(value: String).void }
  def eventname=(value); end

  sig { returns(Google::Protobuf::RepeatedField[PgQuery::Node]) }
  def funcname; end

  sig { params(value: Google::Protobuf::RepeatedField[PgQuery::Node]).void }
  def funcname=(value); end

  sig { returns(String) }
  def trigname; end

  sig { params(value: String).void }
  def trigname=(value); end

  sig { returns(Google::Protobuf::RepeatedField[PgQuery::Node]) }
  def whenclause; end

  sig { params(value: Google::Protobuf::RepeatedField[PgQuery::Node]).void }
  def whenclause=(value); end
end
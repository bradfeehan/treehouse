# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `PgQuery::CreateFdwStmt`.
# Please instead update this file by running `bin/tapioca dsl PgQuery::CreateFdwStmt`.

class PgQuery::CreateFdwStmt
  sig do
    params(
      fdwname: T.nilable(String),
      func_options: T.nilable(T.any(Google::Protobuf::RepeatedField[PgQuery::Node], T::Array[PgQuery::Node])),
      options: T.nilable(T.any(Google::Protobuf::RepeatedField[PgQuery::Node], T::Array[PgQuery::Node]))
    ).void
  end
  def initialize(fdwname: nil, func_options: T.unsafe(nil), options: T.unsafe(nil)); end

  sig { void }
  def clear_fdwname; end

  sig { void }
  def clear_func_options; end

  sig { void }
  def clear_options; end

  sig { returns(String) }
  def fdwname; end

  sig { params(value: String).void }
  def fdwname=(value); end

  sig { returns(Google::Protobuf::RepeatedField[PgQuery::Node]) }
  def func_options; end

  sig { params(value: Google::Protobuf::RepeatedField[PgQuery::Node]).void }
  def func_options=(value); end

  sig { returns(Google::Protobuf::RepeatedField[PgQuery::Node]) }
  def options; end

  sig { params(value: Google::Protobuf::RepeatedField[PgQuery::Node]).void }
  def options=(value); end
end

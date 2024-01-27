# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `PgQuery::TransactionStmt`.
# Please instead update this file by running `bin/tapioca dsl PgQuery::TransactionStmt`.

class PgQuery::TransactionStmt
  sig do
    params(
      chain: T.nilable(T::Boolean),
      gid: T.nilable(String),
      kind: T.nilable(T.any(Symbol, Integer)),
      options: T.nilable(T.any(Google::Protobuf::RepeatedField[PgQuery::Node], T::Array[PgQuery::Node])),
      savepoint_name: T.nilable(String)
    ).void
  end
  def initialize(chain: nil, gid: nil, kind: nil, options: T.unsafe(nil), savepoint_name: nil); end

  sig { returns(T::Boolean) }
  def chain; end

  sig { params(value: T::Boolean).void }
  def chain=(value); end

  sig { void }
  def clear_chain; end

  sig { void }
  def clear_gid; end

  sig { void }
  def clear_kind; end

  sig { void }
  def clear_options; end

  sig { void }
  def clear_savepoint_name; end

  sig { returns(String) }
  def gid; end

  sig { params(value: String).void }
  def gid=(value); end

  sig { returns(T.any(Symbol, Integer)) }
  def kind; end

  sig { params(value: T.any(Symbol, Integer)).void }
  def kind=(value); end

  sig { returns(Google::Protobuf::RepeatedField[PgQuery::Node]) }
  def options; end

  sig { params(value: Google::Protobuf::RepeatedField[PgQuery::Node]).void }
  def options=(value); end

  sig { returns(String) }
  def savepoint_name; end

  sig { params(value: String).void }
  def savepoint_name=(value); end
end

# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `PgQuery::ExplainStmt`.
# Please instead update this file by running `bin/tapioca dsl PgQuery::ExplainStmt`.

class PgQuery::ExplainStmt
  sig do
    params(
      options: T.nilable(T.any(Google::Protobuf::RepeatedField[PgQuery::Node], T::Array[PgQuery::Node])),
      query: T.nilable(PgQuery::Node)
    ).void
  end
  def initialize(options: T.unsafe(nil), query: nil); end

  sig { void }
  def clear_options; end

  sig { void }
  def clear_query; end

  sig { returns(Google::Protobuf::RepeatedField[PgQuery::Node]) }
  def options; end

  sig { params(value: Google::Protobuf::RepeatedField[PgQuery::Node]).void }
  def options=(value); end

  sig { returns(T.nilable(PgQuery::Node)) }
  def query; end

  sig { params(value: T.nilable(PgQuery::Node)).void }
  def query=(value); end
end

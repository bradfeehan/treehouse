# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `PgQuery::VariableSetStmt`.
# Please instead update this file by running `bin/tapioca dsl PgQuery::VariableSetStmt`.

class PgQuery::VariableSetStmt
  sig do
    params(
      args: T.nilable(T.any(Google::Protobuf::RepeatedField[PgQuery::Node], T::Array[PgQuery::Node])),
      is_local: T.nilable(T::Boolean),
      kind: T.nilable(T.any(Symbol, Integer)),
      name: T.nilable(String)
    ).void
  end
  def initialize(args: T.unsafe(nil), is_local: nil, kind: nil, name: nil); end

  sig { returns(Google::Protobuf::RepeatedField[PgQuery::Node]) }
  def args; end

  sig { params(value: Google::Protobuf::RepeatedField[PgQuery::Node]).void }
  def args=(value); end

  sig { void }
  def clear_args; end

  sig { void }
  def clear_is_local; end

  sig { void }
  def clear_kind; end

  sig { void }
  def clear_name; end

  sig { returns(T::Boolean) }
  def is_local; end

  sig { params(value: T::Boolean).void }
  def is_local=(value); end

  sig { returns(T.any(Symbol, Integer)) }
  def kind; end

  sig { params(value: T.any(Symbol, Integer)).void }
  def kind=(value); end

  sig { returns(String) }
  def name; end

  sig { params(value: String).void }
  def name=(value); end
end
# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `PgQuery::AlterExtensionStmt`.
# Please instead update this file by running `bin/tapioca dsl PgQuery::AlterExtensionStmt`.

class PgQuery::AlterExtensionStmt
  sig do
    params(
      extname: T.nilable(String),
      options: T.nilable(T.any(Google::Protobuf::RepeatedField[PgQuery::Node], T::Array[PgQuery::Node]))
    ).void
  end
  def initialize(extname: nil, options: T.unsafe(nil)); end

  sig { void }
  def clear_extname; end

  sig { void }
  def clear_options; end

  sig { returns(String) }
  def extname; end

  sig { params(value: String).void }
  def extname=(value); end

  sig { returns(Google::Protobuf::RepeatedField[PgQuery::Node]) }
  def options; end

  sig { params(value: Google::Protobuf::RepeatedField[PgQuery::Node]).void }
  def options=(value); end
end

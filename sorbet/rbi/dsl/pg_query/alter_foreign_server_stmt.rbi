# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `PgQuery::AlterForeignServerStmt`.
# Please instead update this file by running `bin/tapioca dsl PgQuery::AlterForeignServerStmt`.

class PgQuery::AlterForeignServerStmt
  sig do
    params(
      has_version: T.nilable(T::Boolean),
      options: T.nilable(T.any(Google::Protobuf::RepeatedField[PgQuery::Node], T::Array[PgQuery::Node])),
      servername: T.nilable(String),
      version: T.nilable(String)
    ).void
  end
  def initialize(has_version: nil, options: T.unsafe(nil), servername: nil, version: nil); end

  sig { void }
  def clear_has_version; end

  sig { void }
  def clear_options; end

  sig { void }
  def clear_servername; end

  sig { void }
  def clear_version; end

  sig { returns(T::Boolean) }
  def has_version; end

  sig { params(value: T::Boolean).void }
  def has_version=(value); end

  sig { returns(Google::Protobuf::RepeatedField[PgQuery::Node]) }
  def options; end

  sig { params(value: Google::Protobuf::RepeatedField[PgQuery::Node]).void }
  def options=(value); end

  sig { returns(String) }
  def servername; end

  sig { params(value: String).void }
  def servername=(value); end

  sig { returns(String) }
  def version; end

  sig { params(value: String).void }
  def version=(value); end
end

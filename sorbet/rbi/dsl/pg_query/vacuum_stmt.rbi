# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `PgQuery::VacuumStmt`.
# Please instead update this file by running `bin/tapioca dsl PgQuery::VacuumStmt`.

class PgQuery::VacuumStmt
  sig do
    params(
      is_vacuumcmd: T.nilable(T::Boolean),
      options: T.nilable(T.any(Google::Protobuf::RepeatedField[PgQuery::Node], T::Array[PgQuery::Node])),
      rels: T.nilable(T.any(Google::Protobuf::RepeatedField[PgQuery::Node], T::Array[PgQuery::Node]))
    ).void
  end
  def initialize(is_vacuumcmd: nil, options: T.unsafe(nil), rels: T.unsafe(nil)); end

  sig { void }
  def clear_is_vacuumcmd; end

  sig { void }
  def clear_options; end

  sig { void }
  def clear_rels; end

  sig { returns(T::Boolean) }
  def is_vacuumcmd; end

  sig { params(value: T::Boolean).void }
  def is_vacuumcmd=(value); end

  sig { returns(Google::Protobuf::RepeatedField[PgQuery::Node]) }
  def options; end

  sig { params(value: Google::Protobuf::RepeatedField[PgQuery::Node]).void }
  def options=(value); end

  sig { returns(Google::Protobuf::RepeatedField[PgQuery::Node]) }
  def rels; end

  sig { params(value: Google::Protobuf::RepeatedField[PgQuery::Node]).void }
  def rels=(value); end
end

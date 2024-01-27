# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `PgQuery::CopyStmt`.
# Please instead update this file by running `bin/tapioca dsl PgQuery::CopyStmt`.

class PgQuery::CopyStmt
  sig do
    params(
      attlist: T.nilable(T.any(Google::Protobuf::RepeatedField[PgQuery::Node], T::Array[PgQuery::Node])),
      filename: T.nilable(String),
      is_from: T.nilable(T::Boolean),
      is_program: T.nilable(T::Boolean),
      options: T.nilable(T.any(Google::Protobuf::RepeatedField[PgQuery::Node], T::Array[PgQuery::Node])),
      query: T.nilable(PgQuery::Node),
      relation: T.nilable(PgQuery::RangeVar),
      where_clause: T.nilable(PgQuery::Node)
    ).void
  end
  def initialize(attlist: T.unsafe(nil), filename: nil, is_from: nil, is_program: nil, options: T.unsafe(nil), query: nil, relation: nil, where_clause: nil); end

  sig { returns(Google::Protobuf::RepeatedField[PgQuery::Node]) }
  def attlist; end

  sig { params(value: Google::Protobuf::RepeatedField[PgQuery::Node]).void }
  def attlist=(value); end

  sig { void }
  def clear_attlist; end

  sig { void }
  def clear_filename; end

  sig { void }
  def clear_is_from; end

  sig { void }
  def clear_is_program; end

  sig { void }
  def clear_options; end

  sig { void }
  def clear_query; end

  sig { void }
  def clear_relation; end

  sig { void }
  def clear_where_clause; end

  sig { returns(String) }
  def filename; end

  sig { params(value: String).void }
  def filename=(value); end

  sig { returns(T::Boolean) }
  def is_from; end

  sig { params(value: T::Boolean).void }
  def is_from=(value); end

  sig { returns(T::Boolean) }
  def is_program; end

  sig { params(value: T::Boolean).void }
  def is_program=(value); end

  sig { returns(Google::Protobuf::RepeatedField[PgQuery::Node]) }
  def options; end

  sig { params(value: Google::Protobuf::RepeatedField[PgQuery::Node]).void }
  def options=(value); end

  sig { returns(T.nilable(PgQuery::Node)) }
  def query; end

  sig { params(value: T.nilable(PgQuery::Node)).void }
  def query=(value); end

  sig { returns(T.nilable(PgQuery::RangeVar)) }
  def relation; end

  sig { params(value: T.nilable(PgQuery::RangeVar)).void }
  def relation=(value); end

  sig { returns(T.nilable(PgQuery::Node)) }
  def where_clause; end

  sig { params(value: T.nilable(PgQuery::Node)).void }
  def where_clause=(value); end
end

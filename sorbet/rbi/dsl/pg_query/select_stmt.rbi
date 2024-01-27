# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `PgQuery::SelectStmt`.
# Please instead update this file by running `bin/tapioca dsl PgQuery::SelectStmt`.

class PgQuery::SelectStmt
  sig do
    params(
      all: T.nilable(T::Boolean),
      distinct_clause: T.nilable(T.any(Google::Protobuf::RepeatedField[PgQuery::Node], T::Array[PgQuery::Node])),
      from_clause: T.nilable(T.any(Google::Protobuf::RepeatedField[PgQuery::Node], T::Array[PgQuery::Node])),
      group_clause: T.nilable(T.any(Google::Protobuf::RepeatedField[PgQuery::Node], T::Array[PgQuery::Node])),
      group_distinct: T.nilable(T::Boolean),
      having_clause: T.nilable(PgQuery::Node),
      into_clause: T.nilable(PgQuery::IntoClause),
      larg: T.nilable(PgQuery::SelectStmt),
      limit_count: T.nilable(PgQuery::Node),
      limit_offset: T.nilable(PgQuery::Node),
      limit_option: T.nilable(T.any(Symbol, Integer)),
      locking_clause: T.nilable(T.any(Google::Protobuf::RepeatedField[PgQuery::Node], T::Array[PgQuery::Node])),
      op: T.nilable(T.any(Symbol, Integer)),
      rarg: T.nilable(PgQuery::SelectStmt),
      sort_clause: T.nilable(T.any(Google::Protobuf::RepeatedField[PgQuery::Node], T::Array[PgQuery::Node])),
      target_list: T.nilable(T.any(Google::Protobuf::RepeatedField[PgQuery::Node], T::Array[PgQuery::Node])),
      values_lists: T.nilable(T.any(Google::Protobuf::RepeatedField[PgQuery::Node], T::Array[PgQuery::Node])),
      where_clause: T.nilable(PgQuery::Node),
      window_clause: T.nilable(T.any(Google::Protobuf::RepeatedField[PgQuery::Node], T::Array[PgQuery::Node])),
      with_clause: T.nilable(PgQuery::WithClause)
    ).void
  end
  def initialize(all: nil, distinct_clause: T.unsafe(nil), from_clause: T.unsafe(nil), group_clause: T.unsafe(nil), group_distinct: nil, having_clause: nil, into_clause: nil, larg: nil, limit_count: nil, limit_offset: nil, limit_option: nil, locking_clause: T.unsafe(nil), op: nil, rarg: nil, sort_clause: T.unsafe(nil), target_list: T.unsafe(nil), values_lists: T.unsafe(nil), where_clause: nil, window_clause: T.unsafe(nil), with_clause: nil); end

  sig { returns(T::Boolean) }
  def all; end

  sig { params(value: T::Boolean).void }
  def all=(value); end

  sig { void }
  def clear_all; end

  sig { void }
  def clear_distinct_clause; end

  sig { void }
  def clear_from_clause; end

  sig { void }
  def clear_group_clause; end

  sig { void }
  def clear_group_distinct; end

  sig { void }
  def clear_having_clause; end

  sig { void }
  def clear_into_clause; end

  sig { void }
  def clear_larg; end

  sig { void }
  def clear_limit_count; end

  sig { void }
  def clear_limit_offset; end

  sig { void }
  def clear_limit_option; end

  sig { void }
  def clear_locking_clause; end

  sig { void }
  def clear_op; end

  sig { void }
  def clear_rarg; end

  sig { void }
  def clear_sort_clause; end

  sig { void }
  def clear_target_list; end

  sig { void }
  def clear_values_lists; end

  sig { void }
  def clear_where_clause; end

  sig { void }
  def clear_window_clause; end

  sig { void }
  def clear_with_clause; end

  sig { returns(Google::Protobuf::RepeatedField[PgQuery::Node]) }
  def distinct_clause; end

  sig { params(value: Google::Protobuf::RepeatedField[PgQuery::Node]).void }
  def distinct_clause=(value); end

  sig { returns(Google::Protobuf::RepeatedField[PgQuery::Node]) }
  def from_clause; end

  sig { params(value: Google::Protobuf::RepeatedField[PgQuery::Node]).void }
  def from_clause=(value); end

  sig { returns(Google::Protobuf::RepeatedField[PgQuery::Node]) }
  def group_clause; end

  sig { params(value: Google::Protobuf::RepeatedField[PgQuery::Node]).void }
  def group_clause=(value); end

  sig { returns(T::Boolean) }
  def group_distinct; end

  sig { params(value: T::Boolean).void }
  def group_distinct=(value); end

  sig { returns(T.nilable(PgQuery::Node)) }
  def having_clause; end

  sig { params(value: T.nilable(PgQuery::Node)).void }
  def having_clause=(value); end

  sig { returns(T.nilable(PgQuery::IntoClause)) }
  def into_clause; end

  sig { params(value: T.nilable(PgQuery::IntoClause)).void }
  def into_clause=(value); end

  sig { returns(T.nilable(PgQuery::SelectStmt)) }
  def larg; end

  sig { params(value: T.nilable(PgQuery::SelectStmt)).void }
  def larg=(value); end

  sig { returns(T.nilable(PgQuery::Node)) }
  def limit_count; end

  sig { params(value: T.nilable(PgQuery::Node)).void }
  def limit_count=(value); end

  sig { returns(T.nilable(PgQuery::Node)) }
  def limit_offset; end

  sig { params(value: T.nilable(PgQuery::Node)).void }
  def limit_offset=(value); end

  sig { returns(T.any(Symbol, Integer)) }
  def limit_option; end

  sig { params(value: T.any(Symbol, Integer)).void }
  def limit_option=(value); end

  sig { returns(Google::Protobuf::RepeatedField[PgQuery::Node]) }
  def locking_clause; end

  sig { params(value: Google::Protobuf::RepeatedField[PgQuery::Node]).void }
  def locking_clause=(value); end

  sig { returns(T.any(Symbol, Integer)) }
  def op; end

  sig { params(value: T.any(Symbol, Integer)).void }
  def op=(value); end

  sig { returns(T.nilable(PgQuery::SelectStmt)) }
  def rarg; end

  sig { params(value: T.nilable(PgQuery::SelectStmt)).void }
  def rarg=(value); end

  sig { returns(Google::Protobuf::RepeatedField[PgQuery::Node]) }
  def sort_clause; end

  sig { params(value: Google::Protobuf::RepeatedField[PgQuery::Node]).void }
  def sort_clause=(value); end

  sig { returns(Google::Protobuf::RepeatedField[PgQuery::Node]) }
  def target_list; end

  sig { params(value: Google::Protobuf::RepeatedField[PgQuery::Node]).void }
  def target_list=(value); end

  sig { returns(Google::Protobuf::RepeatedField[PgQuery::Node]) }
  def values_lists; end

  sig { params(value: Google::Protobuf::RepeatedField[PgQuery::Node]).void }
  def values_lists=(value); end

  sig { returns(T.nilable(PgQuery::Node)) }
  def where_clause; end

  sig { params(value: T.nilable(PgQuery::Node)).void }
  def where_clause=(value); end

  sig { returns(Google::Protobuf::RepeatedField[PgQuery::Node]) }
  def window_clause; end

  sig { params(value: Google::Protobuf::RepeatedField[PgQuery::Node]).void }
  def window_clause=(value); end

  sig { returns(T.nilable(PgQuery::WithClause)) }
  def with_clause; end

  sig { params(value: T.nilable(PgQuery::WithClause)).void }
  def with_clause=(value); end
end

# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `PgQuery::CTESearchClause`.
# Please instead update this file by running `bin/tapioca dsl PgQuery::CTESearchClause`.

class PgQuery::CTESearchClause
  sig do
    params(
      location: T.nilable(Integer),
      search_breadth_first: T.nilable(T::Boolean),
      search_col_list: T.nilable(T.any(Google::Protobuf::RepeatedField[PgQuery::Node], T::Array[PgQuery::Node])),
      search_seq_column: T.nilable(String)
    ).void
  end
  def initialize(location: nil, search_breadth_first: nil, search_col_list: T.unsafe(nil), search_seq_column: nil); end

  sig { void }
  def clear_location; end

  sig { void }
  def clear_search_breadth_first; end

  sig { void }
  def clear_search_col_list; end

  sig { void }
  def clear_search_seq_column; end

  sig { returns(Integer) }
  def location; end

  sig { params(value: Integer).void }
  def location=(value); end

  sig { returns(T::Boolean) }
  def search_breadth_first; end

  sig { params(value: T::Boolean).void }
  def search_breadth_first=(value); end

  sig { returns(Google::Protobuf::RepeatedField[PgQuery::Node]) }
  def search_col_list; end

  sig { params(value: Google::Protobuf::RepeatedField[PgQuery::Node]).void }
  def search_col_list=(value); end

  sig { returns(String) }
  def search_seq_column; end

  sig { params(value: String).void }
  def search_seq_column=(value); end
end

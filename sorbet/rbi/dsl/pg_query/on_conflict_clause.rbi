# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `PgQuery::OnConflictClause`.
# Please instead update this file by running `bin/tapioca dsl PgQuery::OnConflictClause`.

class PgQuery::OnConflictClause
  sig do
    params(
      action: T.nilable(T.any(Symbol, Integer)),
      infer: T.nilable(PgQuery::InferClause),
      location: T.nilable(Integer),
      target_list: T.nilable(T.any(Google::Protobuf::RepeatedField[PgQuery::Node], T::Array[PgQuery::Node])),
      where_clause: T.nilable(PgQuery::Node)
    ).void
  end
  def initialize(action: nil, infer: nil, location: nil, target_list: T.unsafe(nil), where_clause: nil); end

  sig { returns(T.any(Symbol, Integer)) }
  def action; end

  sig { params(value: T.any(Symbol, Integer)).void }
  def action=(value); end

  sig { void }
  def clear_action; end

  sig { void }
  def clear_infer; end

  sig { void }
  def clear_location; end

  sig { void }
  def clear_target_list; end

  sig { void }
  def clear_where_clause; end

  sig { returns(T.nilable(PgQuery::InferClause)) }
  def infer; end

  sig { params(value: T.nilable(PgQuery::InferClause)).void }
  def infer=(value); end

  sig { returns(Integer) }
  def location; end

  sig { params(value: Integer).void }
  def location=(value); end

  sig { returns(Google::Protobuf::RepeatedField[PgQuery::Node]) }
  def target_list; end

  sig { params(value: Google::Protobuf::RepeatedField[PgQuery::Node]).void }
  def target_list=(value); end

  sig { returns(T.nilable(PgQuery::Node)) }
  def where_clause; end

  sig { params(value: T.nilable(PgQuery::Node)).void }
  def where_clause=(value); end
end

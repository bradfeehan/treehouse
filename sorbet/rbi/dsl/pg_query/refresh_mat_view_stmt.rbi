# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `PgQuery::RefreshMatViewStmt`.
# Please instead update this file by running `bin/tapioca dsl PgQuery::RefreshMatViewStmt`.

class PgQuery::RefreshMatViewStmt
  sig do
    params(
      concurrent: T.nilable(T::Boolean),
      relation: T.nilable(PgQuery::RangeVar),
      skip_data: T.nilable(T::Boolean)
    ).void
  end
  def initialize(concurrent: nil, relation: nil, skip_data: nil); end

  sig { void }
  def clear_concurrent; end

  sig { void }
  def clear_relation; end

  sig { void }
  def clear_skip_data; end

  sig { returns(T::Boolean) }
  def concurrent; end

  sig { params(value: T::Boolean).void }
  def concurrent=(value); end

  sig { returns(T.nilable(PgQuery::RangeVar)) }
  def relation; end

  sig { params(value: T.nilable(PgQuery::RangeVar)).void }
  def relation=(value); end

  sig { returns(T::Boolean) }
  def skip_data; end

  sig { params(value: T::Boolean).void }
  def skip_data=(value); end
end

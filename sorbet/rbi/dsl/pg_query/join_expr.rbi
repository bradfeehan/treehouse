# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `PgQuery::JoinExpr`.
# Please instead update this file by running `bin/tapioca dsl PgQuery::JoinExpr`.

class PgQuery::JoinExpr
  sig do
    params(
      alias: T.nilable(PgQuery::Alias),
      is_natural: T.nilable(T::Boolean),
      join_using_alias: T.nilable(PgQuery::Alias),
      jointype: T.nilable(T.any(Symbol, Integer)),
      larg: T.nilable(PgQuery::Node),
      quals: T.nilable(PgQuery::Node),
      rarg: T.nilable(PgQuery::Node),
      rtindex: T.nilable(Integer),
      using_clause: T.nilable(T.any(Google::Protobuf::RepeatedField[PgQuery::Node], T::Array[PgQuery::Node]))
    ).void
  end
  def initialize(alias: nil, is_natural: nil, join_using_alias: nil, jointype: nil, larg: nil, quals: nil, rarg: nil, rtindex: nil, using_clause: T.unsafe(nil)); end

  sig { returns(T.nilable(PgQuery::Alias)) }
  def alias; end

  sig { params(value: T.nilable(PgQuery::Alias)).void }
  def alias=(value); end

  sig { void }
  def clear_alias; end

  sig { void }
  def clear_is_natural; end

  sig { void }
  def clear_join_using_alias; end

  sig { void }
  def clear_jointype; end

  sig { void }
  def clear_larg; end

  sig { void }
  def clear_quals; end

  sig { void }
  def clear_rarg; end

  sig { void }
  def clear_rtindex; end

  sig { void }
  def clear_using_clause; end

  sig { returns(T::Boolean) }
  def is_natural; end

  sig { params(value: T::Boolean).void }
  def is_natural=(value); end

  sig { returns(T.nilable(PgQuery::Alias)) }
  def join_using_alias; end

  sig { params(value: T.nilable(PgQuery::Alias)).void }
  def join_using_alias=(value); end

  sig { returns(T.any(Symbol, Integer)) }
  def jointype; end

  sig { params(value: T.any(Symbol, Integer)).void }
  def jointype=(value); end

  sig { returns(T.nilable(PgQuery::Node)) }
  def larg; end

  sig { params(value: T.nilable(PgQuery::Node)).void }
  def larg=(value); end

  sig { returns(T.nilable(PgQuery::Node)) }
  def quals; end

  sig { params(value: T.nilable(PgQuery::Node)).void }
  def quals=(value); end

  sig { returns(T.nilable(PgQuery::Node)) }
  def rarg; end

  sig { params(value: T.nilable(PgQuery::Node)).void }
  def rarg=(value); end

  sig { returns(Integer) }
  def rtindex; end

  sig { params(value: Integer).void }
  def rtindex=(value); end

  sig { returns(Google::Protobuf::RepeatedField[PgQuery::Node]) }
  def using_clause; end

  sig { params(value: Google::Protobuf::RepeatedField[PgQuery::Node]).void }
  def using_clause=(value); end
end

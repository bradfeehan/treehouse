# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `PgQuery::RangeTblFunction`.
# Please instead update this file by running `bin/tapioca dsl PgQuery::RangeTblFunction`.

class PgQuery::RangeTblFunction
  sig do
    params(
      funccolcollations: T.nilable(T.any(Google::Protobuf::RepeatedField[PgQuery::Node], T::Array[PgQuery::Node])),
      funccolcount: T.nilable(Integer),
      funccolnames: T.nilable(T.any(Google::Protobuf::RepeatedField[PgQuery::Node], T::Array[PgQuery::Node])),
      funccoltypes: T.nilable(T.any(Google::Protobuf::RepeatedField[PgQuery::Node], T::Array[PgQuery::Node])),
      funccoltypmods: T.nilable(T.any(Google::Protobuf::RepeatedField[PgQuery::Node], T::Array[PgQuery::Node])),
      funcexpr: T.nilable(PgQuery::Node),
      funcparams: T.nilable(T.any(Google::Protobuf::RepeatedField[Integer], T::Array[Integer]))
    ).void
  end
  def initialize(funccolcollations: T.unsafe(nil), funccolcount: nil, funccolnames: T.unsafe(nil), funccoltypes: T.unsafe(nil), funccoltypmods: T.unsafe(nil), funcexpr: nil, funcparams: T.unsafe(nil)); end

  sig { void }
  def clear_funccolcollations; end

  sig { void }
  def clear_funccolcount; end

  sig { void }
  def clear_funccolnames; end

  sig { void }
  def clear_funccoltypes; end

  sig { void }
  def clear_funccoltypmods; end

  sig { void }
  def clear_funcexpr; end

  sig { void }
  def clear_funcparams; end

  sig { returns(Google::Protobuf::RepeatedField[PgQuery::Node]) }
  def funccolcollations; end

  sig { params(value: Google::Protobuf::RepeatedField[PgQuery::Node]).void }
  def funccolcollations=(value); end

  sig { returns(Integer) }
  def funccolcount; end

  sig { params(value: Integer).void }
  def funccolcount=(value); end

  sig { returns(Google::Protobuf::RepeatedField[PgQuery::Node]) }
  def funccolnames; end

  sig { params(value: Google::Protobuf::RepeatedField[PgQuery::Node]).void }
  def funccolnames=(value); end

  sig { returns(Google::Protobuf::RepeatedField[PgQuery::Node]) }
  def funccoltypes; end

  sig { params(value: Google::Protobuf::RepeatedField[PgQuery::Node]).void }
  def funccoltypes=(value); end

  sig { returns(Google::Protobuf::RepeatedField[PgQuery::Node]) }
  def funccoltypmods; end

  sig { params(value: Google::Protobuf::RepeatedField[PgQuery::Node]).void }
  def funccoltypmods=(value); end

  sig { returns(T.nilable(PgQuery::Node)) }
  def funcexpr; end

  sig { params(value: T.nilable(PgQuery::Node)).void }
  def funcexpr=(value); end

  sig { returns(Google::Protobuf::RepeatedField[Integer]) }
  def funcparams; end

  sig { params(value: Google::Protobuf::RepeatedField[Integer]).void }
  def funcparams=(value); end
end
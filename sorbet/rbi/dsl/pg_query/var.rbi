# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `PgQuery::Var`.
# Please instead update this file by running `bin/tapioca dsl PgQuery::Var`.

class PgQuery::Var
  sig do
    params(
      location: T.nilable(Integer),
      varattno: T.nilable(Integer),
      varcollid: T.nilable(Integer),
      varlevelsup: T.nilable(Integer),
      varno: T.nilable(Integer),
      varnullingrels: T.nilable(T.any(Google::Protobuf::RepeatedField[Integer], T::Array[Integer])),
      vartype: T.nilable(Integer),
      vartypmod: T.nilable(Integer),
      xpr: T.nilable(PgQuery::Node)
    ).void
  end
  def initialize(location: nil, varattno: nil, varcollid: nil, varlevelsup: nil, varno: nil, varnullingrels: T.unsafe(nil), vartype: nil, vartypmod: nil, xpr: nil); end

  sig { void }
  def clear_location; end

  sig { void }
  def clear_varattno; end

  sig { void }
  def clear_varcollid; end

  sig { void }
  def clear_varlevelsup; end

  sig { void }
  def clear_varno; end

  sig { void }
  def clear_varnullingrels; end

  sig { void }
  def clear_vartype; end

  sig { void }
  def clear_vartypmod; end

  sig { void }
  def clear_xpr; end

  sig { returns(Integer) }
  def location; end

  sig { params(value: Integer).void }
  def location=(value); end

  sig { returns(Integer) }
  def varattno; end

  sig { params(value: Integer).void }
  def varattno=(value); end

  sig { returns(Integer) }
  def varcollid; end

  sig { params(value: Integer).void }
  def varcollid=(value); end

  sig { returns(Integer) }
  def varlevelsup; end

  sig { params(value: Integer).void }
  def varlevelsup=(value); end

  sig { returns(Integer) }
  def varno; end

  sig { params(value: Integer).void }
  def varno=(value); end

  sig { returns(Google::Protobuf::RepeatedField[Integer]) }
  def varnullingrels; end

  sig { params(value: Google::Protobuf::RepeatedField[Integer]).void }
  def varnullingrels=(value); end

  sig { returns(Integer) }
  def vartype; end

  sig { params(value: Integer).void }
  def vartype=(value); end

  sig { returns(Integer) }
  def vartypmod; end

  sig { params(value: Integer).void }
  def vartypmod=(value); end

  sig { returns(T.nilable(PgQuery::Node)) }
  def xpr; end

  sig { params(value: T.nilable(PgQuery::Node)).void }
  def xpr=(value); end
end

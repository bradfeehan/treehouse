# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `Google::Protobuf::UninterpretedOption`.
# Please instead update this file by running `bin/tapioca dsl Google::Protobuf::UninterpretedOption`.

class Google::Protobuf::UninterpretedOption
  sig do
    params(
      aggregate_value: T.nilable(String),
      double_value: T.nilable(Float),
      identifier_value: T.nilable(String),
      name: T.nilable(T.any(Google::Protobuf::RepeatedField[Google::Protobuf::UninterpretedOption::NamePart], T::Array[Google::Protobuf::UninterpretedOption::NamePart])),
      negative_int_value: T.nilable(Integer),
      positive_int_value: T.nilable(Integer),
      string_value: T.nilable(String)
    ).void
  end
  def initialize(aggregate_value: nil, double_value: nil, identifier_value: nil, name: T.unsafe(nil), negative_int_value: nil, positive_int_value: nil, string_value: nil); end

  sig { returns(String) }
  def aggregate_value; end

  sig { params(value: String).void }
  def aggregate_value=(value); end

  sig { void }
  def clear_aggregate_value; end

  sig { void }
  def clear_double_value; end

  sig { void }
  def clear_identifier_value; end

  sig { void }
  def clear_name; end

  sig { void }
  def clear_negative_int_value; end

  sig { void }
  def clear_positive_int_value; end

  sig { void }
  def clear_string_value; end

  sig { returns(Float) }
  def double_value; end

  sig { params(value: Float).void }
  def double_value=(value); end

  sig { returns(String) }
  def identifier_value; end

  sig { params(value: String).void }
  def identifier_value=(value); end

  sig { returns(Google::Protobuf::RepeatedField[Google::Protobuf::UninterpretedOption::NamePart]) }
  def name; end

  sig { params(value: Google::Protobuf::RepeatedField[Google::Protobuf::UninterpretedOption::NamePart]).void }
  def name=(value); end

  sig { returns(Integer) }
  def negative_int_value; end

  sig { params(value: Integer).void }
  def negative_int_value=(value); end

  sig { returns(Integer) }
  def positive_int_value; end

  sig { params(value: Integer).void }
  def positive_int_value=(value); end

  sig { returns(String) }
  def string_value; end

  sig { params(value: String).void }
  def string_value=(value); end
end

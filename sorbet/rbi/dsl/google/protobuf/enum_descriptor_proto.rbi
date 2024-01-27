# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `Google::Protobuf::EnumDescriptorProto`.
# Please instead update this file by running `bin/tapioca dsl Google::Protobuf::EnumDescriptorProto`.

class Google::Protobuf::EnumDescriptorProto
  sig do
    params(
      name: T.nilable(String),
      options: T.nilable(Google::Protobuf::EnumOptions),
      reserved_name: T.nilable(T.any(Google::Protobuf::RepeatedField[String], T::Array[String])),
      reserved_range: T.nilable(T.any(Google::Protobuf::RepeatedField[Google::Protobuf::EnumDescriptorProto::EnumReservedRange], T::Array[Google::Protobuf::EnumDescriptorProto::EnumReservedRange])),
      value: T.nilable(T.any(Google::Protobuf::RepeatedField[Google::Protobuf::EnumValueDescriptorProto], T::Array[Google::Protobuf::EnumValueDescriptorProto]))
    ).void
  end
  def initialize(name: nil, options: nil, reserved_name: T.unsafe(nil), reserved_range: T.unsafe(nil), value: T.unsafe(nil)); end

  sig { void }
  def clear_name; end

  sig { void }
  def clear_options; end

  sig { void }
  def clear_reserved_name; end

  sig { void }
  def clear_reserved_range; end

  sig { void }
  def clear_value; end

  sig { returns(String) }
  def name; end

  sig { params(value: String).void }
  def name=(value); end

  sig { returns(T.nilable(Google::Protobuf::EnumOptions)) }
  def options; end

  sig { params(value: T.nilable(Google::Protobuf::EnumOptions)).void }
  def options=(value); end

  sig { returns(Google::Protobuf::RepeatedField[String]) }
  def reserved_name; end

  sig { params(value: Google::Protobuf::RepeatedField[String]).void }
  def reserved_name=(value); end

  sig { returns(Google::Protobuf::RepeatedField[Google::Protobuf::EnumDescriptorProto::EnumReservedRange]) }
  def reserved_range; end

  sig { params(value: Google::Protobuf::RepeatedField[Google::Protobuf::EnumDescriptorProto::EnumReservedRange]).void }
  def reserved_range=(value); end

  sig { returns(Google::Protobuf::RepeatedField[Google::Protobuf::EnumValueDescriptorProto]) }
  def value; end

  sig { params(value: Google::Protobuf::RepeatedField[Google::Protobuf::EnumValueDescriptorProto]).void }
  def value=(value); end
end
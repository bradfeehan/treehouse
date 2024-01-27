# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `Google::Protobuf::ServiceDescriptorProto`.
# Please instead update this file by running `bin/tapioca dsl Google::Protobuf::ServiceDescriptorProto`.

class Google::Protobuf::ServiceDescriptorProto
  sig do
    params(
      method: T.nilable(T.any(Google::Protobuf::RepeatedField[Google::Protobuf::MethodDescriptorProto], T::Array[Google::Protobuf::MethodDescriptorProto])),
      name: T.nilable(String),
      options: T.nilable(Google::Protobuf::ServiceOptions)
    ).void
  end
  def initialize(method: T.unsafe(nil), name: nil, options: nil); end

  sig { void }
  def clear_method; end

  sig { void }
  def clear_name; end

  sig { void }
  def clear_options; end

  sig { returns(Google::Protobuf::RepeatedField[Google::Protobuf::MethodDescriptorProto]) }
  def method; end

  sig { params(value: Google::Protobuf::RepeatedField[Google::Protobuf::MethodDescriptorProto]).void }
  def method=(value); end

  sig { returns(String) }
  def name; end

  sig { params(value: String).void }
  def name=(value); end

  sig { returns(T.nilable(Google::Protobuf::ServiceOptions)) }
  def options; end

  sig { params(value: T.nilable(Google::Protobuf::ServiceOptions)).void }
  def options=(value); end
end

# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `Google::Protobuf::FeatureSetDefaults::FeatureSetEditionDefault`.
# Please instead update this file by running `bin/tapioca dsl Google::Protobuf::FeatureSetDefaults::FeatureSetEditionDefault`.

class Google::Protobuf::FeatureSetDefaults::FeatureSetEditionDefault
  sig { params(edition: T.nilable(T.any(Symbol, Integer)), features: T.nilable(Google::Protobuf::FeatureSet)).void }
  def initialize(edition: nil, features: nil); end

  sig { void }
  def clear_edition; end

  sig { void }
  def clear_features; end

  sig { returns(T.any(Symbol, Integer)) }
  def edition; end

  sig { params(value: T.any(Symbol, Integer)).void }
  def edition=(value); end

  sig { returns(T.nilable(Google::Protobuf::FeatureSet)) }
  def features; end

  sig { params(value: T.nilable(Google::Protobuf::FeatureSet)).void }
  def features=(value); end
end
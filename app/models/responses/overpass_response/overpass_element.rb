# typed: strict
# frozen_string_literal: true

require 'delegate'

module Responses
  class OverpassResponse < Response
    # Represents a single node in the Overpass API response
    class OverpassElement < SimpleDelegator
      include Kernel
      extend T::Generic
      extend T::Sig

      include CalculatesAddress

      delegate :inspect, to: :@node
      alias to_s inspect

      sig { params(node: T::Hash[Symbol, T.untyped]).void }
      def initialize(node)
        @node = node
        super(node)
      end

      # TODO: associate created facilities with this response, i.e. facilities.build(...)
      # a join table with response_id, parseable_type, parseable_id
      # extract some "Parseable" concern -- a model that can be parsed from a Response model
      # associate each Parseable with the Response it was parsed from
      sig { returns(Facility) }
      def to_facility
        facility = Facility.lock.find_or_initialize_by(external_id: id)
        facility.assign_attributes(name:, address: calculated_address)
        facility.geocodes.find_or_initialize_by(address: calculated_address, latitude:, longitude:)
        facility
      end

      sig { returns(String) }
      def id
        @id ||= T.let(@node.fetch(:id), T.nilable(String))
      end

      sig { returns(T.nilable(String)) }
      def name
        @name ||= T.let(find_tag('name'), T.nilable(String))
      end

      sig { override.returns(T.nilable(String)) }
      def address_unit
        @address_unit ||= T.let(find_tag('addr:unit'), T.nilable(String))
      end

      sig { override.returns(T.nilable(String)) }
      def address_house
        @address_house ||= T.let(find_tag('addr:housenumber'), T.nilable(String))
      end

      sig { override.returns(T.nilable(String)) }
      def address_street
        find_tag('addr:street').presence
      end

      sig { override.returns(T.nilable(String)) }
      def address_city
        @address_city ||= T.let(find_tag('addr:city'), T.nilable(String))
      end

      sig { override.returns(T.nilable(String)) }
      def address_state
        @address_state ||= T.let(find_tag('addr:state'), T.nilable(String))
      end

      sig { override.returns(T.nilable(String)) }
      def address_postcode
        @address_postcode ||= T.let(find_tag('addr:postcode'), T.nilable(String))
      end

      sig { returns(T.nilable(Float)) }
      def latitude
        @latitude ||= T.let(Float(@node.fetch(:lat)), T.nilable(Float))
      end

      sig { returns(T.nilable(Float)) }
      def longitude
        @longitude ||= T.let(Float(@node.fetch(:lon)), T.nilable(Float))
      end

      private

      sig { params(key: String).returns(T.nilable(String)) }
      def find_tag(key)
        @node.fetch(:tag).find { _1[:k] == key }&.fetch(:v)
      end
    end
  end
end

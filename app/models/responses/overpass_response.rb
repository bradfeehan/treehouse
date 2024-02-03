# typed: strict
# frozen_string_literal: true

require 'delegate'

module Responses
  # Represents a response from querying the Overpass API
  class OverpassResponse < Response
    extend T::Generic
    extend T::Sig

    Element = type_member { { fixed: OverpassElement } }
    Model = type_member { { fixed: Facility } }

    sig { override.returns(T::Enumerable[Model]) }
    def parse!
      elements.map do |element|
        Rails.logger.debug { "Parsing element: #{element.id} '#{element.name}'" }
        facility_for(element)
      end
    end

    private

    sig { params(element: Element).returns(Model) }
    def facility_for(element)
      # TODO: associate created facilities with this response, i.e. facilities.build(...)
      # a join table with response_id, parseable_type, parseable_id
      # extract some "Parseable" concern -- a model that can be parsed from a Response model
      # associate each Parseable with the Response it was parsed from
      Facility.new(external_id: element.id, name: element.name).tap do |facility|
        Rails.logger.debug { "Creating geocode: lat=#{element.latitude} lon=#{element.longitude}" }
        facility.geocodes.build(latitude: element.latitude, longitude: element.longitude)
      end
    end

    sig { returns(T::Enumerable[Element]) }
    def elements
      nodes.map { |node| OverpassElement.new({}.replace(node)) }
    end

    sig { returns(T::Enumerator[Saxerator::Builder::HashElement]) }
    def nodes
      parser.for_tag(:node).lazy
    end

    sig { returns(Saxerator::FullDocument) }
    def parser
      @parser ||= T.let(
        Saxerator.parser(body) do |config|
          config.adapter = :ox
          config.output_type = :hash
          config.put_attributes_in_hash!
          config.symbolize_keys!
        end,
        T.nilable(Saxerator::FullDocument),
      )
    end

    # Represents a single node in the Overpass API response
    class OverpassElement < SimpleDelegator
      include Kernel
      extend T::Sig

      delegate :inspect, to: :__getobj__
      alias to_s inspect

      sig { params(node: T::Hash[Symbol, T.untyped]).void }
      def initialize(node)
        @node = node
        super(node)
      end

      sig { returns(String) }
      def id
        @node.fetch(:id)
      end

      sig { returns(String) }
      def name
        @node.fetch(:tag).find { _1[:k] == 'name' }&.fetch(:v)
      end

      sig { returns(Numeric) }
      def latitude
        Float(@node.fetch(:lat))
      end

      sig { returns(Numeric) }
      def longitude
        Float(@node.fetch(:lon))
      end
    end
  end
end

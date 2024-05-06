# typed: strict
# frozen_string_literal: true

require 'test_helper'
require 'active_decorator/view_context'

class WeeklyRentTest < ActiveSupport::TestCase
  extend T::Sig

  test '#listing exists' do
    assert_not_nil create(:price, :weekly_rent).listing
  end

  test '#to_fs' do
    PARSE_TEST_CASES.each do |test_case, expected_result|
      with_decorated_weekly_rent(test_case) do |price|
        assert_equal expected_result, price.to_fs
      end
    end
  end

  private

  class ParseTestCase < T::Struct
    prop :value, T.nilable(Numeric)
    prop :min, T.nilable(Numeric)
    prop :max, T.nilable(Numeric)
    prop :display_value, T.nilable(String)
  end

  private_constant :ParseTestCase

  PARSE_TEST_CASES = T.let(
    {
      # rubocop:disable Layout/HashAlignment
      ParseTestCase.new(value: 800)                            => '$800',
      ParseTestCase.new(display_value: '$595pw/ $2585pcm')     => '$595',
      ParseTestCase.new(display_value: '$640 - $680 Per Week') => '$640–$680',
      ParseTestCase.new(display_value: '$650.00')              => '$650',
      ParseTestCase.new(display_value: 'Contact Agent')        => 'Contact Agent',
      # rubocop:enable Layout/HashAlignment
    }.freeze,
    T::Hash[ParseTestCase, String],
  )

  private_constant :PARSE_TEST_CASES

  sig { params(test: ParseTestCase, _block: T.proc.params(arg0: PriceDecorator).void).void }
  def with_decorated_weekly_rent(test, &_block) # rubocop:disable Naming/BlockForwarding
    price = build(:price, :weekly_rent, value: test.value, min: test.min, max: test.max, display: test.display_value)
    ActiveDecorator::ViewContext.run_with(ApplicationController.new.view_context) do
      yield ActiveDecorator::Decorator.instance.decorate price
    end
  end
end

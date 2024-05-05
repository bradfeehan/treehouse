# typed: strict
# frozen_string_literal: true

# A type of price representing the weekly rent for a listing
class WeeklyRent < Price
  extend T::Sig

  sig { override.returns(T::Boolean) }
  def rent? = true
end

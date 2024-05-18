# typed: strict
# frozen_string_literal: true

# == Schema Information
#
# Table name: prices
#
#  id         :bigint           not null, primary key
#  display    :string
#  max        :decimal(, )
#  min        :decimal(, )
#  type       :string           not null
#  value      :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  listing_id :bigint           not null
#
# Indexes
#
#  index_prices_on_listing_id  (listing_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (listing_id => listings.id)
#

# A type of price representing the weekly rent for a listing
class WeeklyRent < Price
  extend T::Sig

  sig { override.returns(T::Boolean) }
  def rent? = true
end

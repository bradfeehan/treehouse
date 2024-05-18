# typed: strict
# frozen_string_literal: true

class AddUrlToResponsePageElements < ActiveRecord::Migration[7.1]
  extend T::Sig

  sig { void }
  def change
    add_column :response_page_elements, :url, :string
  end
end

# frozen_string_literal: true

class ForcedRate < ApplicationRecord
  validates :currency, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0.0 }
  validates :expire_at, presence: true

  scope :for_usd, -> { find_by(currency: 'USD') }
end
# frozen_string_literal: true

class CentralBankRate < ApplicationRecord
  validates :currency, presence: true
  validates :price, presence: true, numericality: { greater_than: 0.0 }

  scope :for_usd, -> { where(currency: 'USD') }
  scope :by_created_at_desc, -> { order(created_at: :desc) }

  def self.latest_for_usd
    for_usd.by_created_at_desc.first
  end
end

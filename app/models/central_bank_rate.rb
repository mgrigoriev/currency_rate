# frozen_string_literal: true

class CentralBankRate < ApplicationRecord
  validates :currency, presence: true
  validates :price, presence: true, numericality: { greater_than: 0.0 }

  scope :for, ->(currency) { where(currency: currency) }
  scope :by_created_at_desc, -> { order(created_at: :desc) }
  scope :today, -> { where(created_at: Time.zone.today.all_day) }

  def self.latest_for_usd
    self.for('USD').by_created_at_desc.first
  end
end

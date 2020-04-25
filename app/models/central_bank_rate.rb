# frozen_string_literal: true

class CentralBankRate < ApplicationRecord
  validates :currency, presence: true
  validates :price, presence: true, numericality: { greater_than: 0.0 }
end

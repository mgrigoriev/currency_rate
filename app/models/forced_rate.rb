# frozen_string_literal: true

class ForcedRate < ApplicationRecord
  validates :currency, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0.0 }
  validates :expire_at, presence: true
  validate :expires_in_future

  class << self
    def for(currency)
      where(currency: currency).find_by('expire_at > ?', Time.current)
    end

    def for_usd
      self.for('USD')
    end
  end

  def expires_in_future
    errors.add(:expire_at, 'must be in the future') if expire_at.present? && expire_at <= Time.current
  end
end

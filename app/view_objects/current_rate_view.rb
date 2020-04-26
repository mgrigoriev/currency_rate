# frozen_string_literal: true

class CurrentRateView
  def self.formatted_price_for_usd
    return if CurrentRate.price_for_usd.blank?

    ActiveSupport::NumberHelper.number_to_currency(
      CurrentRate.price_for_usd, locale: 'ru', unit: '₽', separator: ',', format: '%n %u'
    )
  end
end

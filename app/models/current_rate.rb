# frozen_string_literal: true

class CurrentRate
  class << self
    def formatted_price_for_usd
      return if price_for_usd.blank?

      ActiveSupport::NumberHelper.number_to_currency(
        price_for_usd, locale: 'ru', unit: '₽', separator: ',', format: '%n %u'
      )
    end

    def price_for_usd
      rate = ForcedRate.active_for_usd || CentralBankRate.latest_for_usd
      rate&.price
    end
  end
end

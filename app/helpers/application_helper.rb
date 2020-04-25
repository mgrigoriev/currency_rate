# frozen_string_literal: true

module ApplicationHelper
  def formatted_currency_rate(price)
    number_to_currency(price, locale: 'ru', unit: '₽', separator: ',', format: '%n %u')
  end
end

# frozen_string_literal: true

require 'open-uri'

class FetchCentralBankRate
  CURRENCY = 'USD'
  XML_URL = 'http://www.cbr.ru/scripts/XML_daily.asp'
  USD_XPATH = "//ValCurs/Valute[@ID='R01235']/Value"

  def self.call
    new.call
  end

  def call
    page = HTTP.get(XML_URL).to_s
    doc = Nokogiri::XML(page)
    usd_rate = doc.xpath(USD_XPATH).text.sub(',', '.').to_f

    return unless usd_rate.positive?

    CentralBankRate.today.find_or_create_by!(currency: CURRENCY, price: usd_rate)
  end
end

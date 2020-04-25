# frozen_string_literal: true

require 'open-uri'

class FetchCentralBankRate
  XML_URL   = 'http://www.cbr.ru/scripts/XML_daily.asp'
  USD_XPATH = "//ValCurs/Valute[@ID='R01235']/Value"

  def self.call
    new.call
  end

  def call
    page = HTTP.get(XML_URL).to_s
    doc = Nokogiri::XML(page)
    usd_rate = doc.xpath(USD_XPATH).text.sub(',', '.').to_f

    CentralBankRate.create!(currency: 'USD', price: usd_rate) if usd_rate > 0
  end
end

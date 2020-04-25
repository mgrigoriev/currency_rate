# frozen_string_literal: true

class CurrentRate
  def self.price_for_usd
    rate = ForcedRate.active_for_usd || CentralBankRate.latest_for_usd
    rate&.price
  end
end

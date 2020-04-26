class BroadcastCurrentRate
  def self.call
    price = CurrentRateView.formatted_price_for_usd
    ActionCable.server.broadcast('current_rate', price: price) if price.present?
  end
end

class FetchCentralBankRateJob < ApplicationJob
  queue_as :default

  def perform
    FetchCentralBankRate.call
    BroadcastCurrentRate.call
  end
end

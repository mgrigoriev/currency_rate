class BroadcastCurrentRateJob < ApplicationJob
  queue_as :default

  def perform
    BroadcastCurrentRate.call
  end
end

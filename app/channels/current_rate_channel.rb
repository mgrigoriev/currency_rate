class CurrentRateChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'current_rate'
  end

  def unsubscribed
    stop_all_streams
  end
end

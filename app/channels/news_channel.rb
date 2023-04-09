class NewsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "NewsChannel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

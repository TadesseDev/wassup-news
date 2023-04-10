class UpdateChannel < ApplicationCable::Channel
  def subscribed
    stream_from "UpdateChannel#{session.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

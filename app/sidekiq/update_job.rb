class UpdateJob
  include Sidekiq::Job

  def perform(url, category, channel_id, search)
    p
    response = HTTParty.get(url)
    if response.code == 200
      stream_to_channel(
        channel_id,
        { category => JSON.parse(response.body), :search => search }
      )
    else
      stream_to_channel(channel_id, { category => "Error: #{response.code}" })
    end
  end

  private

  def stream_to_channel(channel_id, data)
    ActionCable.server.broadcast(
      "UpdateChannel",
      { id: channel_id, data: data }
    )
  end
end

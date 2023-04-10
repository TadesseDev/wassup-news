class LoadNewsJob
  include Sidekiq::Job

  # TODO: Optimize this function of code
  def perform(url, category, channel_id)
    data = {}

    response = HTTParty.get(url + "&category=general")
    stream_to_channel(channel_id, { "general" => JSON.parse(response.body) })
    Category.all.each do |category|
      response = HTTParty.get(url + "&category=#{category.name}")
      if response.code == 200
        stream_to_channel(
          channel_id,
          { category.name => JSON.parse(response.body) }
        )
      else
        stream_to_channel(
          channel_id,
          { category.name => "Error: #{response.code}" }
        )
      end
    end
    stream_to_channel(channel_id, { "all-don" => true })
  end

  private

  def stream_to_channel(channel_id, data)
    ActionCable.server.broadcast("NewsChannel", { id: channel_id, data: data })
  end
end

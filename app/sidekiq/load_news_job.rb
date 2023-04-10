class LoadNewsJob
  include Sidekiq::Job

  # TODO: Optimize this function of code
  def perform(url, category)
    data = {}

    Category.all.each do |category|
      response = HTTParty.get(url + "&category=#{category.name}")
      if response.code == 200
        data[category.name] = JSON.parse(response.body)
      else
        data[category.name] = "Error: #{response.code}"
      end
    end


    data["all-done"] = true
    stream_to_channel(data)
  end

  private

  def stream_to_channel(data)
    ActionCable.server.broadcast("NewsChannel", data)
  end
end

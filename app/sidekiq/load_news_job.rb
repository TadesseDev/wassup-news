class LoadNewsJob
  include Sidekiq::Job

  def perform(url, category)
    data = {}
    response = HTTParty.get(url)
    if response.code == 200
      # todo: Optimize this line of code
      data["top-news"] = JSON.parse(response.body)
    else
      data["top-news"] = "Error: #{response.code}"
    end
    if category.nil?
      Category.all.each do |category|
        response = HTTParty.get(url + "&category=#{category.name}")
        if response.code == 200
          # todo: Optimize this line of code
          data[category.name] = JSON.parse(response.body)
        else
          data[category.name] = "Error: #{response.code}"
        end
      end
    end
    data["close-socket"] = true
    stream_to_channel(data)
  end

  private

  def stream_to_channel(data)
    ActionCable.server.broadcast("NewsChannel", data)
  end
end

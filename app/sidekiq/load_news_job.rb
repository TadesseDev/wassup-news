class LoadNewsJob
  include Sidekiq::Job

  def perform(url)
    response = HTTParty.get(url)
    if response.code == 200
      # todo: Optimize this line of code
      sleep 1.seconds
      p response.body
      data = JSON.parse(response.body)
      p "success loading news"
      ActionCable.server.broadcast("NewsChannel", data)
      # p response.body
    else
      p "error loading news"
      ActionCable.server.broadcast("NewsChannel", "Error: #{response.code}")
      # p response.body
    end
    # Do something
  end
end

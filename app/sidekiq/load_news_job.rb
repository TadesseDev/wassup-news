class LoadNewsJob
  include Sidekiq::Job

  def perform(url)
    sidekiq_options_hash = false
    response = HTTParty.get(url)
    if response.code == 200
      p "success loading news"
      ActionCable.server.broadcast("NewsChannel", response.body)
      # p response.body
    else
      p "error loading news"
      ActionCable.server.broadcast("NewsChannel", "Error: #{response.code}")
      # p response.body
    end
    # Do something
  end
end

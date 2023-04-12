class UsersController < ApplicationController
  before_action :subscription_params

  def subscribe
    country, category, keyword, frequency, email, name =
      subscription_params().values_at(
        :country,
        :category,
        :keyword,
        :frequency,
        :email,
        :name
      )
    user = User.find_by(email: email) || User.create(name: name, email: email)

    subscription =
      Subscription.new(
        user: user,
        country: country,
        category: category,
        keyword: keyword,
        frequency: frequency
      )

    if subscription.save!
      p "returning turbo stream"
    else
      p "returning error"
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(
      :country,
      :category,
      :keyword,
      :frequency,
      :email,
      :name
    )
  end
end

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
      notification = {
        title: "Subscription created",
        message: "We will keep you updated  #{frequency}",
        type: "success"
      }
    else # subscription fails
      notification = {
        title: "Fail to create subscription",
        message: "Please try again",
        type: "error"
      }
    end

    if request.format.turbo_stream?
      render turbo_stream:
               turbo_stream.append(
                 "subscription-notification",
                 partial: "notification",
                 locals: {
                   notification: notification
                 }
               )
    else
      render json: notification, status: :ok if request.format.json?
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

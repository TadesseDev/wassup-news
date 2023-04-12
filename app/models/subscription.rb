class Subscription < ApplicationRecord
  validates :frequency, inclusion: %w[hourly daily weekly monthly]
  belongs_to :user
end

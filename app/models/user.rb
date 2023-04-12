class User < ApplicationRecord
  validates :email,
            presence: true,
            uniqueness: {
              message: "This email already exists, Please use another email"
            }
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :name, presence: { message: "Name is required" }
  has_many :subscriptions, dependent: :destroy
end

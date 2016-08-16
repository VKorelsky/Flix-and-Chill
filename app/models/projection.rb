class Projection < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  #validations
  validates :date, presence: {message: "The projection needs a date"}
  validates :address, presence: {message: "The projection needs an address"}
end

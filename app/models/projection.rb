class Projection < ApplicationRecord
  # Attachinary
  has_attachment :photo

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  # Validations
  validates :date, presence: {message: "The projection needs a date"}
  validates :address, presence: {message: "The projection needs an address"}
end

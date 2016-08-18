class Projection < ApplicationRecord
  # Attachinary
  has_attachment :photo

  # Geocoding
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  # Associations
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  # Validations
  validates :date, presence: {message: "The projection needs a date"}
  validates :address, presence: {message: "The projection needs an address"}
end

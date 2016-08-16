class Review < ApplicationRecord
  belongs_to :booking
  # TODO: belongs_to :user

  #validations

  validates :rating, inclusion: {in: 0..5}
  validates :content, length: {minimum: 40, message: "Your review must be at least 40 characters long"}

  # def projection
  #   booking.projection
  # end
end

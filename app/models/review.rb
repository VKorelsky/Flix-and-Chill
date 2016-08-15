class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :user, through: :booking
  belongs_to :projection, through: :booking

  #validations

  validates :rating, inclusion: {in: 0..5}
  validates :content, length: {minimum: 40, message: "Your review must be at least 40 characters long"}
end

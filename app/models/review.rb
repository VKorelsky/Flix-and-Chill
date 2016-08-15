class Review < ApplicationRecord
  belongs_to :booking

  #validations
  #TODO: check if validation is needed

  validates :rating, inclusion: {in: 0..5}
  validates :content, length: {minimum: 40, message: "Your review must be at least 40 characters long"}
end

class Projection < ApplicationRecord
  belongs_to :user

  #validations
  validates :date, presence: {message: "The projection needs a date"}
  validates :address, presence: {message: "The projection needs an address"}
end

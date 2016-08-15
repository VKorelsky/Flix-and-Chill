class Booking < ApplicationRecord
  belongs_to :projection
  belongs_to :user

  #TODO: check validity of has_one with ta
  has_one :review

  #validations
end

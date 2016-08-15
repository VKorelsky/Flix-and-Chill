class Booking < ApplicationRecord
  belongs_to :projection
  belongs_to :user

  #validations
end

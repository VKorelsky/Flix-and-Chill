class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :projections
  # validations
  # Devise validates password and email --> can't be blank

  validates :first_name, presence: {message: "You must enter a first name"}
end

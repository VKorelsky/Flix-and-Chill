class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Associations
  has_many :projections, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  # Attachinary
  has_attachment :photo

  # validations
  # Devise validates password and email --> can't be blank

  validates :first_name, presence: {message: "You must enter a first name"}

  # send welcome mail
  # after_create :send_welcome_email

  private

  # send welcome mail
  # def send_welcome_email
  #   UserMailer.welcome(self).deliver_now
  #   # Gildas says "don't really know what and where is deliver_now method"
  # end
end

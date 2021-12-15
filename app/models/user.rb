class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  :registerable
  
  devise :database_authenticatable, :registerable, :confirmable,
  :recoverable, :rememberable, :validatable
  
  
    def welcome_send
      UserMailer.welcome_email(self).deliver_now
    end
    has_many :rents
    has_many :items, through: :rents

    has_many :places
    accepts_nested_attributes_for :places
  end

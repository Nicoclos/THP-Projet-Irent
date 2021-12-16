class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable, :confirmable,
  :recoverable, :rememberable, :validatable
  
  
    def welcome_send
      UserMailer.welcome_email(self).deliver_now
    end
    has_many :orders
    has_many :items, through: :orders

    has_many :places
    accepts_nested_attributes_for :places

    has_many :items

  end
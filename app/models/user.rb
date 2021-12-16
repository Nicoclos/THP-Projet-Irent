class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :orders
    has_many :items, through: :orders

    has_many :places
    accepts_nested_attributes_for :places

    has_many :items
    
    after_create :welcome_send
    def welcome_send
      UserMailMailer.welcome_email(self).deliver_now
    end

  end

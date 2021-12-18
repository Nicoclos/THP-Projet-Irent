class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :orders
    has_many :items, through: :orders

    belongs_to :place

    # accepts_nested_attributes_for :places

    has_many :items
    
    after_create :welcome_send
    def welcome_send
      UserMailer.welcome_email(self).deliver_now
    end


    has_many_attached :profile_picture


  end




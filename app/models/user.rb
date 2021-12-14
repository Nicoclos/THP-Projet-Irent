class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :rents
    has_many :items, through: :rents

    has_many :places
    accepts_nested_attributes_for :places

    has_one_attached :profile_picture


    belongs_to :place


  end

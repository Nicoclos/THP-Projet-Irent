class Item < ApplicationRecord
    has_many :rents
    has_many :users, through: :rents
  
end

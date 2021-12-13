class Item < ApplicationRecord

    has_many :rents
    has_many :users, through: :rents

<<<<<<< HEAD
    has_many :images

    has_many :join_table_item_hashtag
    has_many :hashtags, through: :join_table_item_hashtag

    has_many :join_table_item_category
    has_many :categories, through: :join_table_item_category


=======
>>>>>>> development
end

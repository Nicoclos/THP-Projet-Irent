class Hashtag < ApplicationRecord


    has_many :join_table_item_hashtags
    has_many :items, through: :join_table_item_hashtags

end

class Category < ApplicationRecord

    has_many :join_table_item_categories
    has_many :items, through: :join_table_item_categories

    has_many :sub_categories
    has_many :items

end

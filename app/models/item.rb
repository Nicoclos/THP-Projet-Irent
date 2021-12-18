class Item < ApplicationRecord

    has_many :orders
    has_many :users, through: :orders

    has_many :images, dependent: :destroy

    has_many :join_table_item_hashtag
    has_many :hashtags, through: :join_table_item_hashtag

    has_many :join_table_item_category # delete after check
    has_many :categories, through: :join_table_item_category  # delete after check

    accepts_nested_attributes_for :images

    belongs_to :user
    belongs_to :category


    has_many_attached :img_products



end

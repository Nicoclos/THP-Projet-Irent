class CreateJoinTableItemHashtags < ActiveRecord::Migration[5.2]
  def change
    create_table :join_table_item_hashtags do |t|

      t.belongs_to :item, index: true
      t.belongs_to :hashtag, index: true

 
    end
  end
end

class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :title
      t.string :format
      t.string :url_item_img
      
      t.references :item, foreign_key: true, index: true

      t.timestamps
    end
  end
end

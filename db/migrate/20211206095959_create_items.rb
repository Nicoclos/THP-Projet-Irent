class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.string :summary
      t.text :description
      t.integer :price
      t.integer :available_duration
      t.date :available_start
      t.date :available_end
      
      t.timestamps
    end
  end
end

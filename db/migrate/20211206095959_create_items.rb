class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.string :summary
      t.text :description
      t.integer :price
      t.datetime :start_date
      t.datetime :end_data
      t.integer :duration
      
      t.timestamps
    end
  end
end

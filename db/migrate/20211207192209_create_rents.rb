class CreateRents < ActiveRecord::Migration[5.2]
  def change
    create_table :rents do |t|
      t.integer :quantity
      t.string :stripe_id

      t.belongs_to :item, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end

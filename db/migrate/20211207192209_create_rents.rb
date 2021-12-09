class CreateRents < ActiveRecord::Migration[5.2]
  def change
    create_table :rents do |t|
      t.integer :quantity

      t.timestamps
    end
  end
end

class AddIndexToRents < ActiveRecord::Migration[5.2]
  def change
    change_table :rents do |t|
    t.belongs_to :user, index: true
    t.belongs_to :item, index: true
    end
  end
end

class AddColumnToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :available, :boolean, :default => true
    add_column :items,:title_category,:string
  end
end


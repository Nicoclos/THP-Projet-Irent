class CreateSubCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_categories do |t|
      t.string :title

      t.references :category, foreign_key: true, index: true

    end
  end
end

class AddIndexToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :user, foreign_key: true, index: true
    
    add_reference :items, :category, foreign_key: true, index: true
                                                      
  end
end



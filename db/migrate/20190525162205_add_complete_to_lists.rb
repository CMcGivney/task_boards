class AddCompleteToLists < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :complete, :boolean
  end
end

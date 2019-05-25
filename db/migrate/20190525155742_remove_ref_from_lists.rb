class RemoveRefFromLists < ActiveRecord::Migration[5.2]
  def change
    remove_reference :lists, :board, foreign_key: true
  end
end

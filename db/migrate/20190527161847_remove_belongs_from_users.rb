class RemoveBelongsFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_reference :users, :list, foreign_key: true
  end
end

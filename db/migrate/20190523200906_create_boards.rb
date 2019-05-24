class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.string :name
      t.string :start_date
      t.string :finish_date
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end

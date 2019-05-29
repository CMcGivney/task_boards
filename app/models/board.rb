class Board < ApplicationRecord
  belongs_to :user
  has_many :lists, dependent: :destroy
  

  def self.all_boards(user_id)
    Board.find_by_sql(
      "SELECT *
      FROM boards AS b
      WHERE b.user_id = #{user_id}"
    )
  end

  def self.single_board(board_id, user_id)
    Board.find_by_sql(["
      SELECT *
      FROM boards AS b
      WHERE b.id = ? AND b.user_id = ?
      ", board_id, user_id]).first
  end

   def self.create_board(p, user_id)
    Board.find_by_sql(["
      INSERT INTO boards (name, image, user_id, created_at, updated_at)
      VALUES (:name, :image, :user_id, :created_at, :updated_at);
      ", {
        name: p[:name],
        image: p[:image],
        user_id: user_id,
        created_at: DateTime.now,
        updated_at: DateTime.now
      }])
    end

    def self.update_board(board_id, p)
      Board.find_by_sql(["
        UPDATE boards AS b
        SET name = ?, image = ?, start_date = ?, finish_date = ?, updated_at = ?
        WHERE b.id = ?
        ;", p[:name], p[:image], p[:start_date], p[:finish_date], DateTime.now, board_id])
    end

      def self.delete_board(board_id)
        Board.find_by_sql(["
          DELETE FROM boards AS b
          WHERE b.id = ?;", board_id])
      end

  end

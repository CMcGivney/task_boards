class BoardsController < ApplicationController
  before_action :set_board, only: [ :show, :edit, :update, :destroy]

  def index
    # must write a sql var in models  all_boards
    @boards = Board.all_boards(current_user.id)
  end

  def new
    @board = current_user.boards.new
  end

  def show
  end

  def create
  # INSERT one record write sql board model
    Board.create_board(board_params, current_user.id)
    redirect_to boards_path
  end

  def edit
  end

  def update
    Board.update_board(@board.id, board_params)
    redirect_to boards_path
  end

  def destroy
    Board.delete_board(@board.id)
    redirect_to boards_path
  end

  private

  def set_board
    #must write a method single board in board model w/sql
    @board = Board.single_board(current_user.id, params[:id])
  end
  def board_params
    params.required(:board). permit(:name, :image, :start_date, :finish_date)
  end
end

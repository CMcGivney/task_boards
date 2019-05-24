class ListsController < ApplicationController
  # before_action :set_board
  before_action :set_list, only: [:show, :edit, :updated, :destroy]
  
  def index
    @lists = List.all
  end

  def new
    @list = List.new
    render partial: 'form'
  end

  def create
   @list = Lists.new(list_params)
   if @list.save 
    redirect_to lists_path
   else
    redirect_to :new
   end
  end

  def show

  end

  def edit

  end

  def destroy
  @list.destroy
  redirect_to lists_path
  end

  private
  def set_list
    @list = List.find(params[:id])
  def list_params
    params.require(:list).find(params[:name, :priority])
  end
end

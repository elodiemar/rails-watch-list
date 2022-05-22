class ListsController < ApplicationController
  before_action :set_lists, only: [:show, :edit, :update, :destroy]
  def home
    @lists = List.all
  end

  def show
    @bookmark = Bookmark.new
  end

  def edit
  end

  def update
    @list.update(lists_params)
    redirect_to list_path(@list)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(lists_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def lists_params
    params.require(:list).permit(:name, :photo)
  end

  def set_lists
    @list = List.find(params[:id])
  end
end

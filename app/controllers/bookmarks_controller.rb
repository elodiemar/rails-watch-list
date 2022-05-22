class BookmarksController < ApplicationController
  before_action :set_bookmark, only: %i[new create :edit :update :destroy]

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render "lists/show", status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @bookmark.update(lists_params)
    redirect_to list_path(@list)
  end

  private

  def set_bookmark
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end

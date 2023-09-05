class BookmarksController < ApplicationController
  before_action :set_bookmark, only: %i[show]

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = List.find(params[:list_id])

    if @bookmark.save
      redirect_to list_path(@bookmark.list)
    else
      @list = List.find(params[:list_id])
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end

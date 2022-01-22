class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)

    @list = List.find(params[:list_id])
    @movie = Movie.find(params[:movie_id])

    @bookmark.list = @list
    @bookmark.movie = @movie
    @bookmark.save

    redirect_to list_path(@list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end

class BookmarksController < ApplicationController
  before_action :set_bookmarkkk, only: [:show, :edit, :update, :destroy]
  before_action :set_list, only: [:new]

  def index
    @bookmarks = Bookmark.all
  end

  def show; end # @bookmark = Bookmark.find(params[:id])

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @bookmark.update(bookmark_params)
    redirect_to bookmark_path(@bookmark)
  end

  def destroy
    @bookmark.destroy
    redirect_to list_path, status: :see_other
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end

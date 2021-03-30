class BookmarksController < ApplicationController
  before_action :find_video
  before_action :find_bookmark, only: [:destroy]
  before_action :authenticate_user!
  
  def create
    if already_bookmarked?
      flash[:notice] = "Não pode realizar esta ação duas vezes"
    else
      @video.bookmarks.create(user_id: current_user.id)
    end
    redirect_to video_path(@video)
  end

  def destroy
    
    @bookmark.destroy
    
    redirect_to video_path(@video)
  end

  private

  def find_video
    @video = Video.find(params[:video_id])
  end

  def already_bookmarked?
    Bookmark.where(user_id: current_user.id, video_id: params[:video_id]).exists?
  end

  def find_bookmark
    @bookmark = @video.bookmarks.find(params[:id])
  end
end 
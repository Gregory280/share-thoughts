class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user.name.sub!(/(.+\b.).+\z/, '\1.')
    if @user.teacher == TRUE
      @likes = count_videos_likes(@user)
      @comments = count_videos_comments(@user)
      @videos = @user.videos.page params[:page]
    end
    @bookmarks = Array.new
    @user.bookmarks.each { |bookmark| @bookmarks << Video.find(bookmark.video_id) }
    
  end

  def index
    @users = User.all
  end


private

  def count_videos_comments(user)
    user_videos = user.videos
    count_comments = 0
    user.videos.each do |video|
      count_comments = count_comments + video.comments.count
    end
    @comments = count_comments
  end

  def count_videos_likes(user)
    user_videos = user.videos
    count_likes= 0
    user_videos.each do |video|
      count_likes = count_likes + video.likes.count
    end
    @likes = count_likes
  end

end
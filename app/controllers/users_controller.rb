class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user.name.sub!(/(.+\b.).+\z/, '\1.')
    if @user.teacher == TRUE
      @likes = count_videos_likes(@user)
      @total_views = 0
      @user.videos.each do |vid|
        @total_views = @total_views + vid.impressionist_count
      end
      @videos = @user.videos.page params[:page]
    end
    @bookmarks = Video.joins(:bookmarks).where(bookmarks:{user_id:@user.id}).page params[:page]
    @rel = @user.followers.find_by(follower: current_user)
  end

  def index
    @users = User.all
  end


private

  def count_videos_likes(user)
    user_videos = user.videos
    count_likes= 0
    user_videos.each do |video|
      count_likes = count_likes + video.likes.count
    end
    @likes = count_likes
  end

end
class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @likes = count_videos_likes(@user)
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
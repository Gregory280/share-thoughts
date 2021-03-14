class PagesController < ApplicationController
  def home
    if current_user
      @user = current_user
    end
    @total_teachers = User.where(teacher: TRUE)
    @total_users = User.count
    @levels = Category.level
    @videos = Video.last(4)
  end

  def about
  end

  def my_bookmarks
    @user = current_user
    @bookmarks = Video.joins(:bookmarks).where(bookmarks:{user_id:@user.id}).page params[:page]
  end
  def search
    @results = Video.where("title LIKE ?", "%" + params[:q] + "%").page params[:page]
  end

  def exams
    @toelf = Category.find(3)
    @toelf.videos.last(3)
    @ielts = Category.find(7)
    @ielts.videos.last(3)
  end

  def teachers
    @teachers = User.where(teacher: true).page params[:page]
  end

end


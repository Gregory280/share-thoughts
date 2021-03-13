class PagesController < ApplicationController
  def home
    if current_user
      @user = current_user
    end
  end

  def about
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


class PagesController < ApplicationController
  def home
    if current_user
      @user = current_user
    end
  end

  def about
  end

  def search
    @results = Video.where("title LIKE ?", "%" + params[:q] + "%")
  end

  def teachers
    @teachers = User.where(teacher: true).page params[:page]
  end

end


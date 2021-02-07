class PagesController < ApplicationController
  def home
    if current_user
      @user = current_user
    end
  end

  def about

  end

  def teachers
    @teachers = User.where(teacher: true)
  end

end

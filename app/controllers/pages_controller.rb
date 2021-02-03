class PagesController < ApplicationController
  def home
    if current_user
      @user = current_user
    end
  end

  def about

  end
end

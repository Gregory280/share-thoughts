class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]

  
  def index
    @categories = Category.page params[:page]
  end

  
  def show
    @category = Category.find(params[:id])
    @category_videos = @category.videos
  end

  
  def new
    @category = Category.new
  end

  
  def edit
  end

  
  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to @category, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  
  def update
    if @category.update(category_params)
      redirect_to @category, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  
  def destroy
    @category.destroy
    redirect_to categories_url, notice: 'Category was successfully destroyed.'
  end

  private
    
    def set_category
      @category = Category.find(params[:id])
    end

    
    def category_params
      params.require(:category).permit(:title, :display_in_navbar)
    end
end

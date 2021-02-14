class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  
  def index
    @videos = Video.page params[:page]
  end

  
  def show
    @categories = categories
    @levels = levels
  end

  
  def new
    @video = Video.new
  end

  
  def edit
  end

 
  def create
    @video = Video.new(video_params)
    @video.user = current_user
    if @video.save
      redirect_to @video, notice: 'Video was successfully created.'
    else
      render :new
    end
  end

  
  def update
    if @video.update(video_params)
      redirect_to @video, notice: 'Video was successfully updated.'
    else
      render :edit
    end
  end

  
  def destroy
    @video.destroy
    redirect_to videos_url, notice: 'Video was successfully destroyed.'
  end

  private
    
    def set_video
      @video = Video.find(params[:id])
    end

    
    def video_params
      params.require(:video).permit(:title, :description, :video_file, category_ids: [] )
    end

end

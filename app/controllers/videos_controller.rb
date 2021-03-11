class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  
  def index
    @videos = Video.page params[:page]
  end

  
  def show
    @categories = categories
  
  end

  
  def new
    @video = Video.new
  end

  
  def edit
  end

 
  def create
    @video = Video.new(video_params)
    @video.user = current_user
    respond_to do |format|
      if @video.save
        format.html { redirect_to @video }
      else
        render :new
      end
    end
  end

  
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.turbo_stream { redirect_to @video }
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
      else
        render :edit
      end
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

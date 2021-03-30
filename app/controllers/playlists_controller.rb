class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :edit, :update, :destroy]

  # GET /playlists
  def index
    @playlists = Playlist.all
  end

  # GET /playlists/1
  def show
  end

  # GET /playlists/new
  def new
    @playlist = Playlist.new
  end

  # GET /playlists/1/edit
  def edit
  end

  # POST /playlists
  def create
    @playlist = Playlist.new(playlist_params)
    @playlist.user = current_user
    if @playlist.save
      redirect_to @playlist.user, notice: 'Playlist was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /playlists/1
  def update
    if @playlist.update(playlist_params)
      redirect_to @playlist.user, notice: 'Playlist was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /playlists/1
  def destroy
    @playlist.destroy
    redirect_to @playlist.user, notice: 'Playlist was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def playlist_params
      params.require(:playlist).permit(:title, :user_id, video_ids: [])
    end
end

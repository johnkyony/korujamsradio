class PlaylistsController < ApplicationController
  before_action :authenticate_user!
  def index
     @playlists = Playlist.where(user_id: current_user.id)
     render json: @playlists

  end
  
  def create
    @playlist = Playlist.new(playlist_params)
    @playlist.user_id = current_user.id
    @playlist.published = false

    respond_to do |format|
      if @playlist.save

        format.html { redirect_to @playlist, notice: 'playlist was successfully created.' }
        format.json { render :show, status: :created, location: @playlist }
      else
        format.html { render :new }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def playlist_params
      params.require(:playlist).permit(:name, :image, :user_id)
    end
end

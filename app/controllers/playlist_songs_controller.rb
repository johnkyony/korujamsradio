class PlaylistSongsController < ApplicationController
 def index
    @playlist_songs = PlaylistSong.where(:playlist_id => params[:playlist_id])
   
 end

  def new
   @playlist_song = PlaylistSong.new
  end
  
  def create
    @playlist_song = PlaylistSong.new
    @playlist_song.playlist_id = params[:playlist_id]
    @playlist_song.music_id = params[:music_id]
    respond_to do |format|
      @playlist_song.save
      if @playlist_song.save
        flash[:notice] = "This song has been saved to the playlist"
       
        format.html {  redirect_to :back, notice: 'The song was added to the playlist.' }
        format.json { redirect_to playlist_playlist_songs_path(@playlist_song.playlist_id) , status: :unprocessable_entity  }
      else
        format.html { render :new }
        format.json { render json: @playlist_song.errors, status: :unprocessable_entity }
        
      end
    end
      
  end
  
  

  def show
  end
   def delete
    @playlist_song.music_id = PlaylistSong.find(params[:song_id])
  end
  def destroy    
    
    @playlist_song = PlaylistSong.find_by(:id => params[:id])
    @playlist_song.destroy   
    redirect_to :back
  end

  private
  def playlist_songs_params
    params.require(:playlistSong).permit(:playlist_id , :music_id)
  end
end

class PlaylistcoverimageController < ApplicationController
  def index
    @images = ImageSearcher::Client.new.search(query: "New York")
    render json: @images
  end
  
 
  
end

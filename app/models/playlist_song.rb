class PlaylistSong < ApplicationRecord
  belongs_to :playlist
  belongs_to :music
end

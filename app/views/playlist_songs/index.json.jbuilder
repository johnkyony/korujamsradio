

json.playlist_songs @playlist_songs do |playlistsong|
  json.set! :id, playlistsong.id
  json.set! :name, playlistsong.playlist.name
  json.set! :title, playlistsong.music.title
  json.set! :artwork , playlistsong.music.artwork
end
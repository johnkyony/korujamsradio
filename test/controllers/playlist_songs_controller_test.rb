require 'test_helper'

class PlaylistSongsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get playlist_songs_index_url
    assert_response :success
  end

end

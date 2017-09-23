require 'test_helper'

class PlaylistcoverimageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get playlistcoverimage_index_url
    assert_response :success
  end

end

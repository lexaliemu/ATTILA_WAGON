require 'test_helper'

class FollowedPlaylistsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get followed_playlists_create_url
    assert_response :success
  end

  test "should get destroy" do
    get followed_playlists_destroy_url
    assert_response :success
  end

end

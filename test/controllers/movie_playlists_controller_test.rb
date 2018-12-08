require 'test_helper'

class MoviePlaylistsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get movie_playlists_new_url
    assert_response :success
  end

  test "should get create" do
    get movie_playlists_create_url
    assert_response :success
  end

  test "should get destroy" do
    get movie_playlists_destroy_url
    assert_response :success
  end

end

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @playlists = @user.created_playlists
  end

  def edit
  end

  def update
  end
end

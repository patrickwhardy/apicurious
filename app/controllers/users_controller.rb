class UsersController < ApplicationController
  def show
    @user = current_user
    @activities = Activity.all(@user.oauth_token) if @user
  end
end

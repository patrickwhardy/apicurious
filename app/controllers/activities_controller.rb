class ActivitiesController < ApplicationController
  def show
    @activity = Activity.find(current_user.oauth_token, params[:id])
  end
end

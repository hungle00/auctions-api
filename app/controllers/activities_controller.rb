class ActivitiesController < ApplicationController
  #skip_before_action :authorize_request
  before_action :set_activity, only: [:show]

  # GET /activities/
  def index
    @activities = current_user.activities
    json_response(@activities)
  end

  # GET /activities/:id
  def show
    json_response(@activity)
  end

  private
  def set_activity
    @activity = Activity.find(params[:id])
  end
end

class V2::AuctionsController < ApplicationController
  skip_before_action :authorize_request
  
  def index
    json_response({ message: 'Hello there'})
  end
end

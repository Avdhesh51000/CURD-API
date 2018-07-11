class HomesController < ApplicationController


 before_action :authenticate_request!

  def index
  	debugger
    render json: {'logged_in' => true}
  end

end

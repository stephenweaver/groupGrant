class VisitorsController < ApplicationController
require 'sprockets/railtie'
  def new

  end

  def update_last_ping
    if(current_user)
      current_user.last_ping_time = Time.current
      current_user.save!
    end
     render json: ''
  end
end

class VisitorsController < ApplicationController
require 'sprockets/railtie'
  def new

  end

  def update_last_ping
    if(current_user)
      current_user.last_ping_time = Time.current
      current_user.save!
      Rails.logger.info("update user ping")
    end
     render json: ''
  end
end

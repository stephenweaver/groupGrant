class BusinessesController < ApplicationController
   def create
      if current_user && !current_user.has_profile?
         current_user.profile = Business.create!
         redirect_to root_url
      else
         flash[:alert] = 'Yeah, that was a fail.'
      end
   end

   def index
   	@businesses = Business.all
   end
end
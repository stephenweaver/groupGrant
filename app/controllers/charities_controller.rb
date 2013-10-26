class CharitiesController < ApplicationController
   def create
      if current_user && !current_user.has_profile?
         current_user.profile = Charity.create!
         redirect_to root_url
      else if !current_user
         flash[:alert] = 'You must be signed in to choose this option.'
      else
         flash[:alert] = "You probably already belong to a different user type. Switching roles ain't allowed yet"
      end
   end
end
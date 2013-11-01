class DonorsController < ApplicationController
   def create
      if current_user && !current_user.has_profile?
         current_user.profile = Donor.create!
         redirect_to root_url
      else
         flash[:alert] = 'Yeah, that was a fail.'
      end
   end

   def index
      @donor = Donor.where(id: current_user.user.rolable_id)
   end

end
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

   def show
      @business = Business.find(params[:id])
   end

   def preview
     business = Business.new(params[:business])
     render :text => busness.video_html
   end
end
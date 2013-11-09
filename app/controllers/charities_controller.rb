class CharitiesController < ApplicationController
   include AutoHtml

   def create
      if current_user && !current_user.has_profile?
         current_user.profile = Charity.create!
         redirect_to root_url
      elsif !current_user
         flash[:alert] = 'You must be signed in to choose this option.'
      else
         flash[:alert] = "You probably already belong to a different user type. Switching roles ain't allowed yet"
      end
   end

   def index
      @charities = Charity.all
   end


   def show
      @charity = Charity.find(params[:id])
   end

   def preview
     charity = Charity.new(params[:charity])
     render :text => charity.video_html
   end
end

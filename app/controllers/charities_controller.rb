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
      flash[:notice] = nil
      @categories = CharityCategory.all
      if(params['category'].nil?)
         @charities = Charity.all
         @category_id = 0
      else
         @charities = Charity.where(category_id: params['category'])
         if @charities.count < 1
            @charities = Charity.all
            @category_id = 0
            flash[:notice] = "There are currently no charities in the " + CharityCategory.find(params['category']).name + " category."
         else
            @category_id = params['category']
         end
      end
   end


   def show
      @charity = Charity.find(params[:id])
   end

   def preview
     charity = Charity.new(params[:charity])
     render :text => charity.video_html
   end
end

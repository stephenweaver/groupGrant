class BusinessesController < ApplicationController
   include AutoHtml
   include ActionView::Helpers::SanitizeHelper
   include ActionView::Helpers::TagHelper

   def create
      if current_user && !current_user.has_profile?
         current_user.profile = Business.create!
         redirect_to root_url
      elsif !current_user
         flash[:alert] = 'You must be signed in to choose this option.'
      else
         flash[:alert] = "You probably already belong to a different user type. Switching roles ain't allowed yet"
      end
   end

   def index
      flash[:notice] = nil
      @categories = BusinessCategory.all
      @category_count = Hash.new
      @categories.each do |c|
         @category_count[c.id] = Business.where(category_id: c.id).count
      end
      
      @category_count['all'] = Business.count
      
      if(params['category'].nil?)
         @businesses = Business.all
         @category_id = 0
      else
         @businesses = Business.where(category_id: params['category'])
         if @businesses.count < 1
            @businesses = Business.all
            @category_id = 0
           flash.alert  = "There are currently no businesses in the " + BusinessCategory.find(params['category']).name + " category."
         else
            @category_id = params['category']
         end
      end

      if(!params['search'].nil?)
          @businesses = @businesses.search(params['search'])
      end
   end

   def show
      @business = Business.find(params[:id])      
      not_available = 0

      @available = false
      if user_signed_in? && current_user.rolable_type == "Charity"
         @search_groupgrants = Groupgrant.where(owner_id: current_user.id, partner_id: 0)
         @search_groupgrants.each do |g|
            if Request.where(is_accepted: nil, groupgrant_id: g.id).first != nil
               not_available+= 1
               
            end
         end

         # Check to see if there are groupgrants that have no pending requests
         if not_available < @search_groupgrants.count
            @available = true
         end
      end
   end

   def preview
     business = Business.new(params[:business])
     render :text => business.video_html
   end
end
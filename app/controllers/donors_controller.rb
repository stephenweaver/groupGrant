class DonorsController < ApplicationController
   before_action :set_donor, only: [:show, :edit, :update, :destroy]

   def create
      if current_user && !current_user.has_profile?
         current_user.profile = Donor.create!
         redirect_to root_url
      else
         flash[:alert] = 'Yeah, that was a fail.'
      end
   end

   def new
       @donor = Donor.new
   end

   def index
      @donors = Donor.all
   end

   def show
      
   end

   private

      def set_donor
         @donor = Donor.find(params[:id])
      end

      def donor_params
         params.require(:donor).permit(:first_name, :last_name, user: [:profile, :email])
      end
end
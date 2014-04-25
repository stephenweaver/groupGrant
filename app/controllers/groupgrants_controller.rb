class GroupgrantsController < ApplicationController
before_filter :set_groupgrant, :only => [:show, :edit, :delete, :update]
before_filter :search_businesses, :only => [:payment_form_post]
protect_from_forgery with: :null_session, :only => [:payment_form]

#----------------------------------------------------------------------------------------------------
  # GET /groupgrants
  # GET /groupgrants.json
#----------------------------------------------------------------------------------------------------
  def index
    flash[:notice] = nil
    @categories = GroupgrantCategory.all
    @groupgrant_count = Hash.new

    @categories.each do |c|
      @groupgrant_count[c.id] = Groupgrant.where(category_id: c.id).count
    end

    @groupgrant_count['all'] = Groupgrant.count
      
    if(params['category'].nil?)
      @groupgrants = Groupgrant.all
      @category_id = 0
    else
      @groupgrants = Groupgrant.where(category_id: params['category'])

      if @groupgrants.count < 1
        @groupgrants = Groupgrant.all
        @category_id = 0
        flash.alert  = "There are currently no groupgrants in the " + 
          GroupgrantCategory.find(params['category']).name + " category."
      else
        @category_id = params['category']
      end
    end

    if(!params['search'].nil?)
      @groupgrants = @groupgrants.search(params['search'])
    end   
  end

  #----------------------------------------------------------------------------------------------------
  # GET /groupgrants/1
  # GET /groupgrants/1.json
  #----------------------------------------------------------------------------------------------------
  def show
    @available = false
    if user_signed_in? && current_user.id == @groupgrant.owner_id && @groupgrant.partner_id == 0
      @search_businesses = User.where(rolable_type: "Business")

      # Check for sent requests
      @requests = Request.where(is_accepted: nil, groupgrant_id: @groupgrant.id)
    end
  end

  #----------------------------------------------------------------------------------------------------
  # Cancel a request to connect
  #----------------------------------------------------------------------------------------------------
  def cancelRequest
    groupgrant = Groupgrant.find(params[:id])
    r = Request.where(groupgrant_id: groupgrant.id)
    r = Request.find(r.first)
    m = Message.where(request_id: r.id)
    m = Message.find(m)

    if (r.destroy)
      m.destroy
      render text: "request destroyed"
    else
      render text: "something went wrong"
    end
  end
    
  #----------------------------------------------------------------------------------------------------
  #  Send a request to connect to a groupgrant
  #----------------------------------------------------------------------------------------------------
  def connect
    @groupgrant = Groupgrant.find(params[:id])    
    result = ""

    if (@groupgrant != nil)
      request = Request.create(groupgrant_id: @groupgrant.id)
      message = Message.new(body: "someone wants to be your friend", 
                            user_sent_id:     current_user.id, 
                            user_received_id: @groupgrant.charity.user.id, 
                            request_id:       request.id, read: false)

      if (message.save)
        result = "true"
      else
        request.destroy!
        result = "Request unsuccessful"
      end
    else
      result = "No ID was passed for the groupgrant"
    end
    render text: result
  end


  def request_response
    request = Request.find(params[:id])
    if(!params[:reject].nil? || Groupgrant.find(request.groupgrant_id).nil? || Groupgrant.find(request.groupgrant_id).partner_id != 0)
      request.is_accepted = false
      request.date_responded = Time.current
    elsif(!params[:accept].nil?)
      request.is_accepted = true
      request.date_responded = Time.current
      message    = Message.find_by_request_id(request.id)
      if current_user.rolable_type == "Business"
        partner2   = User.find(message.user_received_id)
      else
        partner2   = User.find(message.user_sent_id)
      end
      groupgrant = Groupgrant.find(request.groupgrant_id)
      groupgrant.partner_id  = partner2.rolable_id
      groupgrant.save!
      
    end
    request.save!
    
    render json: {status: request.is_accepted}
  end

  #----------------------------------------------------------------------------------------------------
  #  This enables a charity to invite a business to connect with their groupgrant
  #----------------------------------------------------------------------------------------------------
  def invite_business    
    groupgrant = Groupgrant.find(params[:gID])
    business = User.find(params[:business])
   
    result = ""

    if (groupgrant.id != nil && Request.find_by_groupgrant_id(groupgrant.id)[0] == nil)
      request = Request.create(groupgrant_id: groupgrant.id)
      message = Message.new(body: "You are invited to join " + groupgrant.name, 
                            user_sent_id:     current_user.id, 
                            user_received_id: business.id,
                            request_id:       request.id)

      if (message.save)
        result = "true"
      else
        request.destroy!
        result = "Request unsuccessful"
      end
    else
      result = Request.find_by_groupgrant_id(groupgrant.id)
    end
    render text: result
  end

  #----------------------------------------------------------------------------------------------------
  # GET /groupgrants/new
  #----------------------------------------------------------------------------------------------------
  def new
    @groupgrant = Groupgrant.new
  end

  #----------------------------------------------------------------------------------------------------
  # GET /groupgrants/1/edit
  #----------------------------------------------------------------------------------------------------
  def edit
  end

  #----------------------------------------------------------------------------------------------------
  # POST /groupgrants
  # POST /groupgrants.json
  #----------------------------------------------------------------------------------------------------
  def create
    @groupgrant = Groupgrant.new(groupgrant_params)
    @groupgrant.owner_id    = current_user.rolable.id
    @groupgrant.partner_id  = 0
    # @groupgrant.goal_amount = 0
    @groupgrant.goal_status = 0
    
    respond_to do |format|      
      if @groupgrant.save
        format.html { redirect_to @groupgrant, notice: 'Groupgrant was successfully created.' }
        format.json { render action: 'show', status: :created, location: @groupgrant }
      else
        format.html { render action: 'new' }
        format.json { render json: @groupgrant.errors, status: :unprocessable_entity }
      end
    end
  end

  #----------------------------------------------------------------------------------------------------
  # PATCH/PUT /groupgrants/1
  # PATCH/PUT /groupgrants/1.json
  #----------------------------------------------------------------------------------------------------
  def update
    newparams = groupgrant_params

    respond_to do |format|
      if @groupgrant.update(newparams)
        format.html { redirect_to @groupgrant, notice: 'Groupgrant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @groupgrant.errors, status: :unprocessable_entity }
      end
    end
  end

  #----------------------------------------------------------------------------------------------------
  # DELETE /groupgrants/1
  # DELETE /groupgrants/1.json
  #----------------------------------------------------------------------------------------------------
  def destroy
    @groupgrant.destroy
    
    respond_to do |format|
      format.html { redirect_to groupgrants_url }
      format.json { head :no_content }
    end
  end
  
  #----------------------------------------------------------------------------------------------------
  #----------------------------------------------------------------------------------------------------
  def payment_form
  end

  #----------------------------------------------------------------------------------------------------
  #----------------------------------------------------------------------------------------------------
  def payment_form_post
    # Get the credit card details submitted by the form
    flash.now[:notice] = nil
    flash.now[:error] = nil
    token  = params[:stripeToken]
    amount = params[:amount].to_i * 100

    @groupgrant = Groupgrant.find(params[:groupgrant])
    cvc = params[:cvc]

    Stripe.api_key = "sk_test_lI4B1u5NPxXesSLYuOnL2u72"

    begin
      # Create the charge on Stripe's servers - this will charge the user's card
      # charge = Stripe::Charge.create(
      #   :card        => token,
      #   :amount      => amount,
      #   :description => "User id: " + current_user.id.to_s,
      #   :currency    => 'usd'
      # )

    if @groupgrant.goal_status.nil?
      @groupgrant.goal_status = 0
    end
    
    

    if amount <= 0
      flash.now[:error] = params[:amount] + " dollars is an invalid amount. Please enter a positive amount."
      # elsif cvc < 300 || cvc > 999
      #   flash[:error] = cvc + " is not a valid CVC code. Must be 3 numerical characters."
      raise
    elsif (current_user.allocated_amount < params[:amount].to_i)
      flash.now[:error] = "Sorry, you have insufficient funds to make such a payment :("
      raise
    else
      if params[:amount].to_i > 0
        @groupgrant.goal_status += params[:amount].to_i
      end
      @groupgrant.save!
      flash.now[:notice] = "Transaction completed. Thank you for your $" + params[:amount] + " donation!"

      

      # withdraw amount donated from user's allocated amount 
      if params[:amount].to_i > 0
        current_user.allocated_amount -= params[:amount].to_i
        current_user.save
      end
    end    

    rescue => e
      
    end
    redirect_to @groupgrant
  end

  private
    #----------------------------------------------------------------------------------------------------
    # Use callbacks to share common setup or constraints between actions.
    #----------------------------------------------------------------------------------------------------
    def set_groupgrant
      @groupgrant = Groupgrant.find(params[:id])
    end

    #  I made this because searching a business wasn't possible after submitting a payment
    def search_businesses
      @groupgrant = Groupgrant.find(params[:groupgrant])
      if user_signed_in? && current_user.id == @groupgrant.owner_id && @groupgrant.partner_id == 0
      @search_businesses = User.where(rolable_type: "Business")

      # Check for sent requests
      @requests = Request.where(is_accepted: nil, groupgrant_id: @groupgrant.id)
      end
    end

    #----------------------------------------------------------------------------------------------------
    # Never trust parameters from the scary internet, only allow the white list through.
    #----------------------------------------------------------------------------------------------------
    def groupgrant_params
      params.require(:groupgrant).permit(:name, :description, :goal_date, 
        :goal_amount, :owner_id, :partner_id, :completed_date, :is_complete,
        :is_enabled, :video_url, :goal_status, :groupgrant_pic, :category_id,:video_url_html)
    end
end

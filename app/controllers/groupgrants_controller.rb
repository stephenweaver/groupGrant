class GroupgrantsController < ApplicationController
before_filter :set_groupgrant, :only => [:show, :edit, :delete, :update]
 protect_from_forgery with: :null_session, :only => [:payment_form]

  # GET /groupgrants
  # GET /groupgrants.json
  def index
    flash[:notice] = nil
      @categories = GroupgrantCategory.all
      @category_count = Hash.new
      @categories.each do |c|
         @category_count[c.id] = Groupgrant.where(category_id: c.id).count
      end
      @category_count['all'] = GroupgrantCategory.count
      
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

  # GET /groupgrants/1
  # GET /groupgrants/1.json
  def show

  end

  # Cancel a request to connect
  def cancelRequest
    groupgrant = Groupgrant.find(params[:id])
    r = Request.where(groupgrant_id: groupgrant.id)
    r = Request.find(r)
    m = Message.where(request_id: r.id)
    m = Message.find(m)
    if (r.destroy)
      m.destroy
      render text: "request destroyed"
    else
      render text: "something went wrong"
    end

  end
    

  def connect
    @groupgrant = Groupgrant.find(params[:id])
    
    result = ""

    if (@groupgrant != nil)
      request = Request.create(groupgrant_id: @groupgrant.id)
      message = Message.new(body: "someone wants to be your friend", 
                               user_sent_id: current_user.id, 
                               user_received_id: @groupgrant.owner_id, 
                               request_id: request.id)
      if (message.save)
        result = "true"
      else
        request.destroy!
        result = "Request unsuccessful"
      end
    else
      result "No ID was passed for the groupgrant"
    end
    render text: result
  end

  # GET /groupgrants/new
  def new
    @groupgrant = Groupgrant.new
  end

  # GET /groupgrants/1/edit
  def edit
  end

  # POST /groupgrants
  # POST /groupgrants.json
  def create
    @groupgrant = Groupgrant.new(groupgrant_params)
    @groupgrant.owner_id   = current_user.id
    @groupgrant.partner_id = 0
    
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

  # PATCH/PUT /groupgrants/1
  # PATCH/PUT /groupgrants/1.json
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

  # DELETE /groupgrants/1
  # DELETE /groupgrants/1.json
  def destroy
    @groupgrant.destroy
    respond_to do |format|
      format.html { redirect_to groupgrants_url }
      format.json { head :no_content }
    end
  end

  def payment_form
  end

  def payment_form_post
    # Get the credit card details submitted by the form
    token  = params[:stripeToken]
    amount = params[:amount].to_i * 100
    
    Stripe.api_key = Rails.configuration.stripe[:secret_key]

    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        :card        => token,
        :amount      => amount, # amount in cents, again
        :currency    => "usd",        
        :description => "payinguser@example.com"
      )

    rescue Stripe::CardError => e
      @var = e
    end
      @var = "Thank you for your donation!"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_groupgrant
      @groupgrant = Groupgrant.find(params[:id])

      # My project wasn't getting the charity's name, so I added this code
      # to make it work.  - Koffi
      @groupgrantOwner = Charity.find(User.find(@groupgrant.owner_id).rolable_id)
      #@groupgrant.charity = @groupgrantOwner
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def groupgrant_params
      params.require(:groupgrant).permit(:name, :description, :goal_date, 
        :goal_amount, :owner_id, :partner_id, :completed_date, :is_complete,
        :is_enabled, :video_url, :goal_status, :groupgrant_pic, :category_id,:video_url_html)
    end
end

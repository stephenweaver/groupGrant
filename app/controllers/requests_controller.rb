class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]

  # GET /requests
  # GET /requests.json
  def index
    # @requests = Request.all
    # raise
    @requests = Message.all_requests
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
  end

  # GET /requests/new
  def new
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params)

    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: 'Request was successfully created.' }
        format.json { render action: 'show', status: :created, location: @request }
      else
        format.html { render action: 'new' }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  def accept
    @message = Message.find(params[:mid])
    @pending = Request.find(@message.request_id)
    @groupgrant = Groupgrant.find(@pending.groupgrant_id)
    @from = User.find(@message.user_sent_id)
    @to   = User.find(@message.user_received_id)

    @pending.is_accepted = true
    @pending.date_responded = Time.current
    if @from.rolable_type == "Charity"
      @groupgrant.partner_id = @from.rolable_id
    else
      @groupgrant.partner_id = @to.rolable_id
    end

    @groupgrant.save!
    @pending.save!

    render text: "true"
  end

  def reject
    @message = Message.find(params[:mid])
    @pending = Request.find(@message.request_id)
    @pending.is_accepted = false
    @pending.date_responded = Time.current
    @pending.save!
    render text: "false"
  end



  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:is_accepted, :is_rejected, :date, :date_responded)
    end


end

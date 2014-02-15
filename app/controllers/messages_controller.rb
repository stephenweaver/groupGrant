class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    message = Message.where("user_received_id = " + current_user.id.to_s + " OR user_sent_id = " + current_user.id.to_s)
    if(!message.empty?)
      if(message.user_received_id == current_user.id)
        first_person_id = message.user_sent_id
      else
        first_person_id = message.user_received_id
      end
      @messages = Message.where( "(user_received_id = :to1 AND user_sent_id = :from1) OR 
                                  (user_received_id = :to2 AND user_sent_id = :from2)", 
                               {from1: current_user.id, 
                                to1: first_person_id, 
                                from2: first_person_id, 
                                to2: current_user.id} )
    else
      @messages = []
    end

  # @messages = Message.where(to: current_user.id)
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render action: 'show', status: :created, location: @message }
      else
        format.html { render action: 'new' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:to, :from, :read, :deleted, :date, :body)
    end
end
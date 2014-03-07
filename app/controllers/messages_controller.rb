class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  protect_from_forgery with: :null_session, :only => [:searchUsers]

  #----------------------------------------------------------------------------------------------------
  # GET /messages
  # GET /messages.json
  #----------------------------------------------------------------------------------------------------
  def index
    if !user_signed_in?
      flash.alert = "You must be logged in to use Messaging"
      redirect_to root_path
      return
    elsif current_user.rolable.class.name != "Charity" && current_user.rolable.class.name != "Business"
      flash.alert = "Messaging is available to Charities and Businesses only"
      redirect_to root_path
      return
    end

    all_messages = (Message.where("user_received_id = " + current_user.id.to_s + " OR user_sent_id = " + current_user.id.to_s)).order(:id)
    user_list = []
    all_messages.each do |x|
      if(x.user_received_id == current_user.id)
        user_list << x.user_sent_id  unless user_list.include?(x.user_sent_id)
      else
        user_list << x.user_received_id unless user_list.include?(x.user_received_id)
      end
    end

    @search_users = searchUsers()
    @friends = User.find(user_list)
    @last_message = all_messages.last()

    # @messages = Message.where(to: current_user.id)
  end

  #----------------------------------------------------------------------------------------------------
  #----------------------------------------------------------------------------------------------------
  def getMessages
    response = ''
    last_user = ''
    last_time = Time.current - 10.years
    if(!current_user.nil?)
      Message.where( "(user_received_id = :to1 AND user_sent_id = :from1) OR
        (user_received_id = :to2 AND user_sent_id = :from2)",
        {from1: current_user.id, to1: params["id"],
          from2: params["id"], to2: current_user.id} 
          ).find_each do |message|

        # Set sender or reciver
        if(message.user_sent_id != current_user.id)
          classname = "active "
        else 
          classname = "text-right"
        end

        # Set time stamp if more than an hour since a message
        if(last_time < message.created_at - 1.hours )
          response += "<tr style='width:100%' class='message_time_stamp chat' style='text-align:center'><td><center>" + message.created_at.localtime.to_formatted_s(:short) + "</center></td></tr>"
        end

        # If this is not a requst and just a normal text message
        if(message.request_id.nil?)
          # Only show the name someone didn't send a message twice in a row
          if(message.user.rolable.name.to_s != last_user || last_time < message.created_at - 1.hours) 
            response += "<tr style='width:100%' class='different_responder chat " + classname.to_s + "''><td>"
            response += "<b>" + message.user.rolable.name.to_s + "</b><br/>"
          else
            response += "<tr style='width:100%' class='chat " + classname.to_s + "'><td class = 'same_responder'>"
          end
          response += message.body.to_s + "</td></tr>"

        # If this is request 
      else
        response += "<tr style='width:100%' class='different_responder chat " + classname.to_s + "''>" + 
        "<td><b>" + message.user.rolable.name.to_s + "</b><br/>" + 
        '<form action="/requests/response" method="post" data-remote="true" class="form inline-form message_request_form">' + 
          '<div><input type="hidden" name="id" value=' + message.request_id.to_s + '>' + 
          '<span>Do you wish to become a partner on <b>' + view_context.link_to(Groupgrant.find(Request.find(message.request_id).groupgrant_id).name, Groupgrant.find(Request.find(message.request_id).groupgrant_id)) + '</b>?</span>&nbsp &nbsp' +
          '<input type="submit" name="accept" value="accept" class="btn btn-success" /> &nbsp' + 
          '<input type="submit" name="reject" value="reject" class="btn btn-danger" /></div>' +
          '</form>' + 
        "</td></tr>"
      end

        # Set what the last message contained
        last_user = message.user.rolable.name.to_s
        last_time =  message.created_at
      end
    end

    render inline: response  
  end

  #----------------------------------------------------------------------------------------------------
  #----------------------------------------------------------------------------------------------------
  def checkAjax
    if(!current_user.nil? && !params['message_id'].nil?)
      messages = Message.where( "(user_received_id = :to1 OR user_sent_id = :from1) AND created_at > :last_time",
        {from1: current_user.id, to1: current_user.id, last_time: Message.find(params['message_id']).created_at} )
      render :json => messages.to_json(:include => { :user => { :include => :rolable }})
    else
      render json: ''
    end
  end

  #----------------------------------------------------------------------------------------------------
  # Return a list of users of the opposite type for the AutoComplete in messaging
  #----------------------------------------------------------------------------------------------------
  def searchUsers
    if current_user.rolable.class.name == "Charity"
      list_a = User.where(rolable_type: 'Business').order(:rolable_id).pluck(:id, :rolable_id)
      search_list = Business.order(:id).pluck(:id, :name)

      search_list.each_with_index do |x, index|
        x[0] = list_a[index][0]
      end
      # sea
      # search_list = Business.where(active: true).pluck(:name)
      # search_list.each do |b|
      #   list << b.name
      # current_user
    elsif current_user.rolable.class.name == "Business"
      list_a = User.where(rolable_type: 'Charity').order(:rolable_id).pluck(:id, :rolable_id)
      search_list = Charity.order(:id).pluck(:id, :name)
      search_list.each_with_index do |x, index|
        x[0] = list_a[index][0]
      end
      # search_list.each do |c|
      #   list << c.name
      # end
    end
    return User.where(rolable_type: 'Charity')
  end

  #----------------------------------------------------------------------------------------------------
  # GET /messages/1
  # GET /messages/1.json
  #----------------------------------------------------------------------------------------------------
  def show
  end

  #----------------------------------------------------------------------------------------------------
  # GET /messages/new
  #----------------------------------------------------------------------------------------------------
  def new
    @message = Message.new
  end

  #----------------------------------------------------------------------------------------------------
  # GET /messages/1/edit
  #----------------------------------------------------------------------------------------------------
  def edit
  end

  #----------------------------------------------------------------------------------------------------
  # POST /messages
  # POST /messages.json
  #----------------------------------------------------------------------------------------------------
  def create
    @message = Message.new(message_params)
    @message.user_sent_id = current_user.id

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render :text => '{"message": "Your messages has been sent"}' }
        #format.json { render action: 'show', status: :created, location: @message }
      else
        format.html { render action: 'new' }
        render text: 'message'
      end
    end
  end

  #----------------------------------------------------------------------------------------------------
  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  #----------------------------------------------------------------------------------------------------
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

  #----------------------------------------------------------------------------------------------------
  # DELETE /messages/1
  # DELETE /messages/1.json
  #----------------------------------------------------------------------------------------------------
  def destroy
    @message.destroy
    
    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end

  private
    #----------------------------------------------------------------------------------------------------
    # Use callbacks to share common setup or constraints between actions.
    #----------------------------------------------------------------------------------------------------
    def set_message
      if (params[:id].nil?)
        # @message = Message.find(params[:id])
      end
    end

    #----------------------------------------------------------------------------------------------------
    # Never trust parameters from the scary internet, only allow the white list through.
    #----------------------------------------------------------------------------------------------------
    def message_params
      params.require(:message).permit(:user_received_id, :user_sent_id, :read, :deleted, :date, :body)
    end
  end

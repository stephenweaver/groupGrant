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
    
    @friends = []
    
    # get people online
    @friends << User.where.not(rolable_type: "Donor").where("last_ping_time >= ?", Time.current - 1.minutes) 

    # get existing conversations
    all_messages.each do |x|
      if(x.user_received_id == current_user.id)
        @friends << User.find(x.user_sent_id)  unless @friends.include?(User.find(x.user_sent_id))
      else
        @friends << User.find(x.user_received_id) unless @friends.include?(User.find(x.user_sent_id))
      end
    end

    # get people up to 10 total people
    if(@friends.count < 9) 
      @friends << User.where.not(rolable_type: ["Donor", current_user.rolable_type]).where("last_ping_time <= ? or last_ping_time is null", Time.current - 1.minutes).limit(10 - @friends.count)
    end
    @friends.flatten!
    @friends.uniq!
    @search_users = searchUsers()
    @last_message = all_messages.last()
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

          if message.read != true
            message.read = true
            message.save!
          end

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
          response += "<tr style='width:100%' class='different_responder chat " + classname.to_s + "''>"
          request = Request.find(message.request_id)
          gg_link = view_context.link_to(Groupgrant.find(Request.find(message.request_id).groupgrant_id).name, Groupgrant.find(Request.find(message.request_id).groupgrant_id))
          buttons = ''
          # If sent it
          if message.user_sent_id == current_user.id 
            if request.is_accepted.nil?
              text_message = "Your request to work together on " + gg_link + " is awaiting response.<br>"
              buttons = '<input type="submit" name="cancel" value="Click to cancel" class="btn btn-danger" />'
            elsif request.is_accepted == true
              text_message = "Your request to work together on " + gg_link + " has been accepted." 
            elsif request.is_accepted == false
              text_message = "Your request to work together on " + gg_link + " has been rejected." 
            end
              
          # If recieved it
          elsif  message.user_sent_id != current_user.id 
            if request.is_accepted.nil?
              text_message = "Would you like to work together on " + gg_link + " groupGrant campaign?"
              buttons = '<input type="submit" name="accept" value="accept" class="btn btn-success" /> &nbsp' + 
                        '<input type="submit" name="reject" value="reject" class="btn btn-danger" /></div>'
            elsif request.is_accepted == true
              text_message = "You have agreed to work together on " + gg_link
            elsif request.is_accepted == false
              text_message = "You decided not to work together on " + gg_link
            end
          end

          response += '<td>' + text_message 
          if buttons != ''
            response +='<form action="<%= Rails.configuration.dumb_url %>/requests/response" method="post" data-remote="true" class="form inline-form message_request_form">' + 
                        '<div><input type="hidden" name="id" value=' + message.request_id.to_s + '>' + 
                        buttons +
                        '</form>'
          end
          '</td></tr>'
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
  def check_for_messages
    if(!current_user.nil? && !params['message_id'].nil?)

      if(Message.exists?(params['message_id']))
        message_time = Message.find(params['message_id']).created_at
      else
        message_time = 2.months.ago
      end

      messages = Message.where( "(user_received_id = :current_user_id OR user_sent_id = :current_user_id) AND created_at > :last_time",
        {current_user_id: current_user.id, last_time: message_time} )
      messages.where(user_received_id: current_user.id, read: false).each do |message|
        message.read = true
        message.save!
      end

      render :json => messages.to_json(:include => { :user => { :include => :rolable }})
    else
      render json: ''
    end
  end

  #----------------------------------------------------------------------------------------------------
  # simply returns true of false if there are any unread messages for the user
  #----------------------------------------------------------------------------------------------------
  def new_message_check
    if(!current_user.nil?)
      ids = Message.where(user_received_id: current_user.id, read: false).pluck(:user_sent_id).uniq
      if ids.count > 0
        ids = Message.where(user_received_id: current_user.id, read: false).pluck(:user_sent_id).uniq
        render text: '{"unread":"true", "ids":[' + ids.join(',') + ']}'
      else
        render text: '{"unread":"false"}'
      end
    else 
        render text: '{"unread":"false"}'
    end
  end

  #----------------------------------------------------------------------------------------------------
  # Return a list of users of the opposite type for the AutoComplete in messaging
  #----------------------------------------------------------------------------------------------------
  def searchUsers
    if current_user.rolable.class.name == "Charity"
      return User.where(rolable_type: 'Business')
      # list_a = User.where(rolable_type: 'Business').order(:rolable_id).pluck(:id, :rolable_id)
      # search_list = Business.order(:id).pluck(:id, :name)

      # search_list.each_with_index do |x, index|
      #   x[0] = list_a[index][0]
      # end
      # sea
      # search_list = Business.where(active: true).pluck(:name)
      # search_list.each do |b|
      #   list << b.name
      # current_user
    elsif current_user.rolable.class.name == "Business"
      return User.where(rolable_type: 'Charity')
      # list_a = User.where(rolable_type: 'Charity').order(:rolable_id).pluck(:id, :rolable_id)
      # search_list = Charity.order(:id).pluck(:id, :name)
      # search_list.each_with_index do |x, index|
      #   x[0] = list_a[index][0]
      # end
      # # search_list.each do |c|
      # #   list << c.name
      # # end
    end
    
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
     @message = Message.find(params[:id])
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
        format.json { render text: 'message'}
      end
    end
  end

  #----------------------------------------------------------------------------------------------------
  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  #----------------------------------------------------------------------------------------------------
  def update
    @message = Message.find(params[:id])
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
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to(:back) 

  end


  def show_all
    @all_messages = Message.all.order('created_at desc')
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

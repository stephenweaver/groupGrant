  require 'rubygems'
  require 'authorize_net'
class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]

  # GET /payments
  # GET /payments.json
  def index
    @payments = Payment.all
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
  end

  # GET /payments/new
  def new
    @payment = Payment.new
  end

  # GET /payments/1/edit
  def edit
  end

  # POST /payments
  # POST /payments.json
  def create
      login_id = '3v6S6AyPAkE'
      transaction_key = '4y2GR4hyw5F44M6s'
      
      @params = params
      card_number = @params[:card_number]
      expiration = @params[:expiration]
      test_card_number = '4111111111111111'
      test_exp_date = '1120'

      transaction = AuthorizeNet::AIM::Transaction.new(login_id, transaction_key,
        :gateway => :sandbox)
      credit_card = AuthorizeNet::CreditCard.new(test_card_number, test_exp_date)
      response = transaction.purchase('10.00', credit_card)

      if response.success?
        render text: "succeeded" #puts "Successfully made a purchase (authorization code: #{response.authorization_code})"
      else
        raise "Failed to make purchase."
      end
  end

  # PATCH/PUT /payments/1
  # PATCH/PUT /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to payments_url }
      format.json { head :no_content }
    end
  end


#   require 'rubygems'
# require 'authorize_net'

# transaction = AuthorizeNet::AIM::Transaction.new('YOUR_API_LOGIN_ID', 'YOUR_TRANSACTION_KEY',
#   :gateway => :sandbox)
# credit_card = AuthorizeNet::CreditCard.new('4111111111111111', '1120')
# response = transaction.purchase('10.00', credit_card)

# if response.success?
#   puts "Successfully made a purchase (authorization code: #{response.authorization_code})"
# else
#   raise "Failed to make purchase."
# end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params[:payment]
    end
end

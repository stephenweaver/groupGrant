class PaymentsController < ApplicationController

  helper :authorize_net
  protect_from_forgery :except => :relay_response

  def new
    @payment = Payment.new
  end

  def create
    redirect_to payments_thank_you_url      
  end 

  # GET
  # Displays a payment form.
  def payment
    @amount = 10.00
    @sim_transaction = AuthorizeNet::SIM::Transaction.new(AUTHORIZE_NET_CONFIG['3v6S6AyPAkE'], AUTHORIZE_NET_CONFIG['4y2GR4hyw5F44M6s'], @amount, :hosted_payment_form => true)
    @sim_transaction.set_hosted_payment_receipt(AuthorizeNet::SIM::HostedReceiptPage.new(:link_method => AuthorizeNet::SIM::HostedReceiptPage::LinkMethod::GET, :link_text => 'Continue', :link_url => payments_thank_you_url(:only_path => false)))
  end
  
  # GET
  # Displays a thank you page.
  def thank_you
    @auth_code = params[:x_auth_code]
  end

end
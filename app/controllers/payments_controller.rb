class PaymentsController < ApplicationController

  def new
    @payment = Payment.new
  end
  def create
    binding.pry
    @payment = Payment.new payment_params.merge(email: stripe_params["stripeEmail"],
      card_token: stripe_params["stripeToken"])
    raise "Please, check registration errors" unless @payment.valid?
    @payment.process_payment
    @payment.save
    redirect_to @payment, notice: 'Registration was successfully created.'
  rescue e
    flash[:error] = e.message
    render :new
  end

  def show
  end
    
  private
  def stripe_params
    params.permit :stripeEmail, :stripeToken
  end
end

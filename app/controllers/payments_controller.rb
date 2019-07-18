class PaymentsController < ApplicationController
  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new payment_params.merge(email: stripe_params["stripeEmail"],
                                                card_token: stripe_params["stripeToken"])
    raise t(".check") unless @payment.valid?

    @payment.process_payment
    @payment.save
    redirect_to @payment, notice: t(".registration")
  rescue e
    flash[:error] = e.message
    render :new
  end

  def show
    @payment = Payment.find params[:id]
  end

  private

  def payment_params
    params.require(:payment).permit(:full_name, :company, :telephone, :email, :card_token)
  end

  def stripe_params
    params.permit :stripeEmail, :stripeToken
  end
end

class Payment < ApplicationRecord
  def process_payment
    customer = Stripe::Customer.create email: email,
                                       card: card_token

    Stripe::Charge.create customer: customer.id,
                          amount: 1000,
                          description: "Test",
                          currency: "usd"
  end
end

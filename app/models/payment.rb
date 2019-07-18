class Payment < ApplicationRecord
  def process_payment
    user = Stripe::User.create email: email,
                               card: card_token

    Stripe::Charge.create user: user.id,
                          amount: 1000,
                          description: "Test",
                          currency: 'usd'
  end
end

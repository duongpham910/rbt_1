class AddStripeCardTokenToPayment < ActiveRecord::Migration[5.2]
  def change
    add_column :payments, :card_token, :string
  end
end

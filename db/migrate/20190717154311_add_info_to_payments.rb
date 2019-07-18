class AddInfoToPayments < ActiveRecord::Migration[5.2]
  def change
    add_column :payments, :full_name, :string
    add_column :payments, :company, :string
    add_column :payments, :telephone, :string
    add_column :payments, :email, :string
  end
end

class RemoveUserFromPayment < ActiveRecord::Migration[5.2]
  def change
    remove_column :payments, :user_id, :integer
  end
end

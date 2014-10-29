class AddUserToReceipt < ActiveRecord::Migration
  def change
    add_reference :receipts, :user, index: true
  end
end

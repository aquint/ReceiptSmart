class AddIndexToReceiptsCreatedAt < ActiveRecord::Migration
  def change
  	add_index :receipts, :created_at
  end
end

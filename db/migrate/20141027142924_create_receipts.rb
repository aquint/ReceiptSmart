class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.string :store
      t.string :credit_card
      t.integer :card_num
      t.decimal :subtotal
      t.decimal :total

      t.timestamps
    end
  end
end

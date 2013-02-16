class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.integer :receipt_id
      t.string :store
      t.string :total
      t.text :note
      t.timestamp :sell_date
      t.timestamp :modified_date
      t.timestamp :created_date
      t.string :categories
      t.string :image

      t.timestamps
    end
  end
end

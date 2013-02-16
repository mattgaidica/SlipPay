class AddSettingsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :post_receipts, :boolean, :default => false
  end
end

class CreateCredentials < ActiveRecord::Migration
  def change
    create_table :credentials do |t|
      t.string :key
      t.string :value
    end
  end
end

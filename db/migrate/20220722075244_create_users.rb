class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :email
      t.text :name
      t.integer :fuel, :default => 0
      t.integer :food, :default => 0
      t.integer :gold, :default => 0

      t.timestamps
    end
  end
end

class CreatePlanets < ActiveRecord::Migration[5.2]
  def change
    create_table :planets do |t|
      t.text :name
      t.integer :fuel
      t.integer :food
      t.integer :gold

      t.timestamps
    end
  end
end

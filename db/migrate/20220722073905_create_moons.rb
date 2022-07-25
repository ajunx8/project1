class CreateMoons < ActiveRecord::Migration[5.2]
  def change
    create_table :moons do |t|
      t.text :name
      t.integer :fuel
      t.integer :food
      t.integer :gold
      t.integer :planet_id

      t.timestamps
    end
  end
end

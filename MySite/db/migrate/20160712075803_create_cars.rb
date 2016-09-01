class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :age
      t.boolean :gender
      t.string :country
      t.string :city
      t.string :password

      t.timestamps null: false
    end
  end
end

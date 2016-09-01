class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |i|
      i.string :name
      i.string :login
      i.string :password
    end
    create_table
  end
end

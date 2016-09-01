class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gender, :boolean
    add_column :users, :date_of_birdth, :date
    add_column :users, :adress, :string
    add_column :users, :age, :integer
  end
end

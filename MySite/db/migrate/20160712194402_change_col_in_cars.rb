class ChangeColInCars < ActiveRecord::Migration
  def change
  	change_column :cars, :uah_price_currency, :string, :default => "USD", :null => false
  end
end

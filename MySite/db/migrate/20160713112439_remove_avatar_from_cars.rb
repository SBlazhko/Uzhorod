class RemoveAvatarFromCars < ActiveRecord::Migration
  def change
  	remove_column :cars, :avatar
  end
end

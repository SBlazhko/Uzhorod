class AddAttachmentAvatarToCarImages < ActiveRecord::Migration
  def self.up
    change_table :car_images do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :car_images, :avatar
  end
end

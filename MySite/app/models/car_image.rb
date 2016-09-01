class CarImage < ActiveRecord::Base

	belongs_to :car

	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>"}, default_url: "/index.png", 
  	:storage => :dropbox, :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
  	:dropbox_options => {:path => proc { |style| "files/#{id}/#{avatar.original_filename}" } }

  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  	# process_in_background :avatar
  	
end

ActiveAdmin.register Car do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
	permit_params :title, :price, car_images_attributes: [:avatar]

	filter :title
	filter :price_cents

	action_item do
		link_to 'Export_to_xls', export_xls_admin_cars_path
	end
	action_item do
		link_to 'Export_to_csv', export_csv_admin_cars_path
	end

	action_item do
		link_to 'To site', cars_path
	end

	index do
    	id_column
    	column :title

    	column 'Photo' do |car|
    		if 	car.car_images.first
    			image_tag car.car_images.first.avatar.url(:thumb)
    		end
    	end
    	column 'Price' do |car|
    		car.price.format
    	end
    	column 'UAH Price' do |car|
    		car.uah_price.format
    	end
    
    actions
	end

	collection_action :export_xls do 
		@cars = Car.all
		send_data @cars.to_xls, content_type: 'application/vnd.ms-excel', filename: 'cars.xls' 
	end

	collection_action :export_csv do 
		@cars = Car.all
		send_data @cars.to_csv, content_type: 'text/csv', filename: 'cars.csv'
	end

	show do
		attributes_table do
			row :title
			row :price
			car.car_images.each do |car_image|
				row :avatar do
					image_tag car_image.avatar.url(:medium)
				end
			end
		end
	end

	form do |f|
	f.inputs do
		f.input :title
		f.input :price
		# f.select :price_currency, [["USD", "usd"], ["EUR", "eur"], ["UAH", "uah"]] 
		f.has_many :car_images do |image|
			image.input :avatar
		end
	end
	f.actions
end
end

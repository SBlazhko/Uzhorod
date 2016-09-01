class Car < ActiveRecord::Base
	  monetize :price_cents, :uah_price_cents

  	before_save :exchange

  	has_many :car_images

  	accepts_nested_attributes_for :car_images

	private 

	def exchange
		self.uah_price_currency = "UAH"	
		self.uah_price = self.price.exchange_to("UAH")
	end



  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      Car.all.each do |car|
        csv << car.attributes.values_at(*column_names)
      end
    end
  end
	# def to_xls(options = {})
 #  {
 #      "Id" => id.to_s,
 #      "Name" => title,
 #      "Price" => price,
 #      "UAH Price" => uah_price,
 #      "Joined" => created_at,
 #      "Last Signed In" => last_sign_in_at
 #  }
  # end
end

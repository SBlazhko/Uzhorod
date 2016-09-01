class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # implement: google_oauth2

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
  			 :omniauthable, :omniauth_providers => [:google_oauth2, :facebook, :twitter, :vkontakte]

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>"}, default_url: "/index.png", 
  :storage => :dropbox, :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
  :dropbox_options => {:path => proc { |style| "files/#{id}/#{avatar.original_filename}" } }

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  before_save :calculate_age

  private

  #Method which calculate user age from user date_of_birth
  def calculate_age
    if self.date_of_birdth
      now = Time.now.utc.to_date
      self.age = now.year - self.date_of_birdth.year - (self.date_of_birdth.to_date.change(year: now.year) > now ? 1 : 0)
    end
  end

# omniauth registrations
 def self.from_omniauth(access_token)
    data = access_token.info
    if data["email"]
      user = User.where(:email => data["email"]).first 
    else
      user = User.where(:email => "#{access_token.uid}@#{access_token.provider}.com").first
    end 

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
        user = User.create(email: data["email"] ? data["email"] : "#{access_token.uid}@#{access_token.provider}.com",
           password: Devise.friendly_token[0,20]
        )
    end
    user
end 	
end

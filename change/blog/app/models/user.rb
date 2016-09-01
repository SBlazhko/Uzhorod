class User < ActiveRecord::Base
  validates :first_name, presence: true, length: {minimum: 2, maximum: 30}
  validates :last_name, presence: true, length: {minimum: 2, maximum: 30}
  validates :email,  presence: true, length: {minimum: 2, maximum: 30}
  validates :age, allow_blank: true, numericality: { only_integer: true, greater_than: 16, less_than: 150 }
  validates :country, allow_blank: true, length: {minimum: 2, maximum: 30}
  validates :city, allow_blank: true, length: {minimum: 2, maximum: 30}
  validates :password, presence: true, length: {minimum: 2, maximum: 30}

  has_many :comments
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :followers, class_name: 'Follow', foreign_key: 'followed_id'
  has_many :followeds, :class_name => 'Follow', :foreign_key => 'follower_id'

end

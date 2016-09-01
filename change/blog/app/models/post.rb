class Post < ActiveRecord::Base
  validates :title, length: {maximum: 100}
  validates :content, length: {maximum: 2000}

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :categories

  before_save :print_short_content

  private
  def print_short_content
    if self.content.present?
    self.short_content = self.content[0..99]
  end
  end
end

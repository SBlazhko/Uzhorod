require 'rails_helper'

RSpec.describe User, type: :model do

  it {should validate_presence_of(:email)}

  it "orders by last name" do
    lindeman = FactoryGirl.create :user
    chelimsky = FactoryGirl.create :user
    expect(User.order(:last_name)).to eq([lindeman,chelimsky])
  end


  # it "orders by gender" do
  #   lindeman = User.create!(first_name: "Andy", last_name: "lindeman", email: "test@mail.com", password: "1111", gender: true)
  #   chelimsky = User.create!(first_name: "Davidina", last_name: "Chelimsky", email: "David@mail.com", password: "2222", gender: false)
  #   expect(User.order(:gender)).to eq(lindeman,chelimsky)
  # end

  it "return_stat" do
    user = FactoryGirl.create :user
    expect({:full_name=>"id = 1 Andy test5 age = 0"}).to eq(user.stats)
  end

    it {should have_db_column(:email)}
    # it {shoild validates_uniqueness(:email)}
    it {have_and_belongs_to_many(:categories)}
    it {should have_db_column(:password)}
    # it {should have_db_index(4)}
end

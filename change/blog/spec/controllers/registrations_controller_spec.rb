require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do

  # describe "GET#stats" do
  #   it "responds successfully with an HTTP 200 status code" do
  #     user1 = FactoryGirl.create :user
  #     get :stats, {user_id: 1}
  #     expect(response).to have_http_status(200)
  #   end
  # end

 it "checkmail" do
    user = FactoryGirl.create :user
    get :chekcemail, {id: user.id}
    expect(response.body).to eq(user.email)
    puts user
  end


    it do
      params = {
        user: {
          first_name: 'John',
          last_name: 'Doe',
          email: 'tester@mail.com',
          password: 'password'
        }
      }
      should permit(:first_name, :last_name, :email, :password).for(:create, params: params).on(:user)
    end

end

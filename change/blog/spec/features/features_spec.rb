require 'rails_helper'

# RSpec.feature "Features", type: :feature do

#     it 'link chec' do
#       uri = URI('https://google.com')
#       response = Net::HTTP.get(uri)
#       expect(response).to be_an_instance_of(String)
#     end

#     it 'google test' do
#       stub_request(:any, "api.test.thinkmobiles.com:8085/api/v1/users/me")
#       # Net::HTTP.get("/api/v1/users/me", "/")
#       # expect(response).to be_an_instance_of(String)
#       # Net::HTTP.get("/api/v1/users/me", "/")
#     end

#     # it 'queries FactoryGirl contributors on github' do
#     #   stub_request(:any, "https://api.github.com")
#     #   res=Net::HTTP.get("https://api.github.com/repos/thoughtbot/factory_girl/contributors", "/")
#     #   # stub_request(:any, "https://api.githusdfsdfsddkfjgdfgjdgvjfdgvfsvsvcsvb.comfdjfdsdjgfjhsdgf")
#     #   # res=Net::HTTP.get("https://api.githfghfgjhfghub.comfdgfdgdfg/repos/thousdfgsdgdfsgfdghdssdsdcsdcdsctbot/factory_girl/contributors", "/")
#     #   expect(res).to be_an_instance_of(String)
#     # end

#   #   it "test with body" do
#   #   stub_request(:post, "https://api.github.com/repos/thoughtbot/factory_girl/contributors")
#   #   with(body: "abc", headers: {'Content_Length' => 3})
#   #   uri = URI.parse("www.github.com")
#   #   req = Net::HTTP::Post.new(uri.path)
#   #   req['Content_Length'] = 3
#   #   res = Net::HTTP.start(uri.host, uri.port) do |http|
#   #     http.request(req, "abc")
#   #   end
#   # end

# end
RSpec.feature "Features", type: :feature do

    # it 'queries FactoryGirl contributors on GitHub' do
    #   uri = URI('https://api.github.com/repos/thoughtbot/factory_girl/contributors')
    #   response = Net::HTTP.get(uri)
    #   expect(response).to be_an_instance_of(String)
    # end

    # it 'queries google.com' do
    #   stub_request(:any, 'www.google.com/')
    #   response = Net::HTTP.get('www.google.com', '/')
    # end

    it 'queries githab.com2' do
      uri = URI.parse('http://ali.test.thinkmobiles.com:8085/api/v1/users/me')
      # stub_request(:post, uri).with(body: 'abc', headers: {'Content-Length'=> 3})
      req = Net::HTTP::Get.new(uri)
      req['Authorization'] = "Token token=1f3f83d375ca4a4ba4e693f424ed58c2"
      Net::HTTP.start(uri.host, uri.port) do |http|
        response = http.request(req)
      end
    end

    it 'queries githab.com2' do
      uri = URI.parse('http://ali.test.thinkmobiles.com:8085/api/v1/users/register')
      request = Net::HTTP::Post.new(uri, initheader = {"Content-Type" =>'application/json'})
      request.body ={
        date_of_birth: "18.02.2000",
        gender: true,
        nickname: Faker::Name.name,
        name: Faker::Name.name,
        phone_number: Faker::PhoneNumber.phone,
        email: Faker::Internet.email,
        password: "1111111"
      }.to_json

      Net::HTTP.start(uri.host, uri.port) do |http|
        response = http.request(request)
      puts "code = " + response.code
      puts "body = " + response.body
      end
    end

    it "gooooogle" do
      var = Faker::Name.name
      puts var
    end
end

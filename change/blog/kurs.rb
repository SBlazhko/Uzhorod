require 'mechanize'
require 'date'
require 'json'
require 'pry'
require 'open-uri'


# kurs = JSON.load(open("http://bank.gov.ua/NBUStatService/v1/statdirectory/exchange?json"))

# kurs.each do |val|
#   if val["cc"] =="EUR"
#     puts val["rate"]
#   end
# end


agent = Mechanize.new
page = agent.get("http://www.bank.gov.ua/control/uk/curmetal/detail/currency?period=daily")

  review_page = page.search('.content')
  review_table = review_page.search('table')[3]
  review_tr = review_table.search('tr')[1..-1].map do |i|
    name = i.search('.cell_c')[1].text
    value = i.search('.cell_c')[3].text.to_f
    count = i.search('.cell_c')[2].text.to_i
    {
      valuta: name,
      kurs: value/count
    }
  end
  puts JSON.pretty_generate(review_tr)

  # agent = Mechanize.new
# page = agent.get("http://www.bank.gov.ua/control/uk/index")

# review_meta = page.search('.classicTable')
# usVal = review_meta.search('.value')[0].text.to_f
# euVal = review_meta.search('.value')[1].text.to_f
#   nbu = {
#     usV: usVal / 100,
#     euV: euVal / 100
#   }
# puts JSON.pretty_generate(nbu)




# i = 1
# j = 3
# arr = []
# while j < 103 do
# review_meta = page.search('.content')
#     name  = page.search('.cell_c')[i].text 
#     value = page.search('.cell_c')[j].text.to_f
#       arr << nbu = {
#         name: name,
#         value: value / 100
#       }
#     i += 4
#     j += 4
# end
#   puts JSON.pretty_generate(arr)

require 'open-uri'
require 'nokogiri'
require 'rubygems'

url = "https://coinmarketcap.com/all/views/all/" 

document = open(url)
content = document.read
page = Nokogiri::HTML(content)


def scraping (page)

symbol = Array.new
price = Array.new 


page.xpath('//a[contains(@class, "price")]').each do |elem|
  price << elem.text.delete("$").to_f
end

page.xpath('//td[contains(@class, "text-left col-symbol")]').each do |elem|
  symbol << elem.text
end

symbol_value_pair = Hash[symbol.zip(price)]
result = [symbol_value_pair.each {|k,v| Hash[k => v] }]

puts result
end

scraping(page)


require 'nokogiri'

def census
  raw_page = gets.chomp
  parsed_page = Nokogiri::HTML(raw_page)
end

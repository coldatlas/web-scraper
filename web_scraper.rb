require 'nokogiri'
require 'open-uri'

def world_population
  parsed_page = Nokogiri::HTML(URI.open('https://en.wikipedia.org/wiki/List_of_countries_and_dependencies_by_population'))
  countries = [], i = 1, total_countries = parsed_page.css('table.wikitable > tbody > tr').map(&:text).count
  while i < total_countries
    country = parsed_page.css("tbody > tr[#{i}]").text
    country = country.split("\n")
    country_hash = { "number": i, "name": country[3], "population": country[4] }
    countries << country_hash
    i += 1
  end
  puts countries
end

puts world_population

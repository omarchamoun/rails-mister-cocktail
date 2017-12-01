# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'


puts "Started seed"
puts "Emptying DB!"

Ingredient.destroy_all

url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"


result = JSON.parse(open(url).read) { |f|
  f.each_line { |line| line}
}

result.each do |ingredients|
  ingredients[1].each do |ingredient|
    i = ingredient["strIngredient1"]
    ing = Ingredient.new(name: i)
    ing.save
    p ing
  end
end

puts "finished seeding"

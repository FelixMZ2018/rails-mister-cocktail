# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

def api_call()
    url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
    ingredient = open(url).read
    return JSON.parse(ingredient)
end
puts "Creating Ingredient List"
api_call["drinks"].each do |single|
    ing = single.values[0]
 @ingredient = Ingredient.new(name: ing)
 @ingredient.save
end
puts "Ingredient list created"

puts "Creating Cocktail List"

### example seeds ###
bd = {name: "Bloody Mary", description: "For I am a sinner in the hands of an angry god. Bloody Mary, full of vodka, blessed are you among cocktails. Pray for me now, at the hour of my death, which I hope is soon.",rating: rand(0..5)}
ng = {name: "Negroni", description: "Easy to make and refreshingly bitter, the Negroni is said to have been invented in Florence by a dauntless Italian count who demanded that the bartender replace the club soda in his Americano with gin. It was a substitution that launched a thousand riffs.",rating: rand(0..5)}
co = {name: "Cosmopolitan", description: "The legendary Cosmopolitan is a simple cocktail with a big history. It reached its height of popularity in the 1990s, when the HBO show “Sex and the City” was at its peak. The pink-hued Martini was a favorite of the characters on the show.",rating: rand(0..5)}

Cocktail.create(bd)
Cocktail.create(ng)
Cocktail.create(co)


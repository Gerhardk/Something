# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Ship.create(:name => "Carrier", :length => 5, :max_per_game => 1)
Ship.create(:name => "Battleship", :length => 4, :max_per_game => 1)
Ship.create(:name => "Destroyer", :length => 3, :max_per_game => 1)
Ship.create(:name => "Submarines", :length => 2, :max_per_game => 2)
Ship.create(:name => "Patrol Boat", :length => 1, :max_per_game => 2)
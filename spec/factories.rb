Factory.define(:ship) do |f|
  f.name "Carrier"
  f.length 5
  f.max_per_game 1

end

Factory.define(:game) do |f|
  f.email "rgkoek@yahoo.com"
  f.name "Gerhard Koekemoer"

end

Factory.define(:game_ship) do |f|
  f.association :game
  f.association :ship
  f.hit_count 0
  f.orientation "horizontal"
  f.sunk false
  f.x 0
  f.y 0

end

Factory.define(:nuke) do |f|
  f.association :game
  f.x 4
  f.y 4
end
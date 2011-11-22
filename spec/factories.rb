Factory.define(:ship) do |f|
  f.name "Carrier"
  f.length 5
  f.max_per_game 1

end

Factory.define(:game) do |f|
  f.email "rgkoek@yahoo.com"
  f.name "Gerhard Koekemoer"

end
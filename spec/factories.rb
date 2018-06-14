FactoryBot.define do 
  factory :ship do 
    name 'Carrier'
    length 5
    max_per_game 1
  end

  factory :game do
    email 'rgkoek@yahoo.com'
    name 'Gerhard Koekemoer'
    server_game_id 1098
    server_hits 0
    client_hits 0
  end

  factory :game_ship, class: GameShip do
    game
    ship
    hit_count 0
    orientation "horizontal"
    sunk false
    x 0
    y 0
  end

  factory :nuke do 
    game
    x 4
    y 4
  end

  factory :block do
    game
    sequence(:x) {|n| n }
    sequence(:y) {|n| n }
  end
end
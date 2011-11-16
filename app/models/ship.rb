class Ship < ActiveRecord::Base
  validates :name, :presence => true
  validates :length, :presence => true, :numericality => true
  validates :max_per_game, :presence => true, :numericality => true
end

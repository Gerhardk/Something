class Ship < ActiveRecord::Base
  validates :name, :presence => true
  validates :length, :presence => true
end

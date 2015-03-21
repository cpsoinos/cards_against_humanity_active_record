class Game < ActiveRecord::Base
  has_many :cards
  has_many :players

  validates :name, presence: true
end

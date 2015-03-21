class Player < ActiveRecord::Base
  has_many :cards
  belongs_to :game

  validates :name, presence: true
end

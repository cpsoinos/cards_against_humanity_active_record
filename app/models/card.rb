class Card < ActiveRecord::Base
  belongs_to :player
  belongs_to :game

  validates :color, presence: true
  validates :content, presence: true
  # require 10 white cards per player_id?
end

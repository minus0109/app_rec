class Radioactor < ApplicationRecord
  has_many :game_radioactors
  has_many :games, through: :game_radioactors
  accepts_nested_attributes_for :game_radioactors, allow_destroy: true
end

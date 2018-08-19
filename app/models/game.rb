class Game < ApplicationRecord
  has_many :gameasps
  has_many :game_categories
  has_many :categories, through: :game_categories
  accepts_nested_attributes_for :game_categories, allow_destroy: true

  has_many :game_radioactors
  has_many :radioactors, through: :game_radioactors
  accepts_nested_attributes_for :game_radioactors, allow_destroy: true
end

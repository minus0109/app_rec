class Category < ApplicationRecord
  has_many :game_categories
  has_many :games, through: :game_categories
  accepts_nested_attributes_for :game_categories, allow_destroy: true
end

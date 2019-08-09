class Ingredient < ApplicationRecord
	validates :name, presence: true, length: {minumum: 3, maximum: 30}
	validates_uniqueness_of :name
	has_many :recipe_ingredients
	has_many :recipes , through: :recipe_ingredients
end
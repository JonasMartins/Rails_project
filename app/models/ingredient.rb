class Ingredient < ActiveRecord::Base

	validates :name, presence: true, length: { minimum: 2, maximum: 25 }
	has_many	:recipe_ingredients
	# many to many assosciation 
	has_many	:recipes, through: :recipe_ingredients
end
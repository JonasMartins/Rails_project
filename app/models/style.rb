class Style < ActiveRecord::Base

	validates :name, presence: true, length: { minimum: 2, maximum: 25 }
	has_many :recipe_styles

	# many to many com recipes sintaxe através de recipes_styles
	has_many :recipes, through: :recipe_styles
end
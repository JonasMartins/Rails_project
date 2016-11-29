class Like < ActiveRecord::Base
	belongs_to :chef
	belongs_to :recipe
	
	# validando unicidade para like/dislike de apenas um chef
	validates_uniqueness_of :chef, scope: :recipe
end
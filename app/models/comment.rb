class Comment < ActiveRecord::Base

	belongs_to :chef
	belongs_to :commentable, polymorphic: true # poliformic ao inves de recipes
	has_many :comments, as: :commentable # comentarios para comentarios

	validates :chef_id, presence: true
	validates :body, presence: true, length: {minumum: 1, maximum: 300}

end
class RecipeController < ApplicationController
	require 'digest/md5'
  
  def index
  	# Variavel de instancia usada na view index, 
  	# usando o active record, nesse caso o all
  	# onde a variavel @recipes é um array
  	# com todos os objetos desse tipo
  	@recipes = Recipe.all
  end
end

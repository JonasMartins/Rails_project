class RecipeController < ApplicationController
	require 'digest/md5'
  
  def index
  	# Variavel de instancia usada na view index, 
  	# usando o active record, nesse caso o all
  	# onde a variavel @recipes é um array
  	# com todos os objetos desse tipo
  	@recipes = Recipe.all
  end

  def show
  	# Pausa o server ao de deparar com algum erro
  	# ex: ao clicar no link e o template não estiver
  	# presente o binding simplesmente para e entra
  	# na linha de comando do pry para maiores informações
  	# binding.pry  	
  	# params para receber o id do objeto a ser mostrado
  	@recipe = Recipe.find(params[:id])

  end
end

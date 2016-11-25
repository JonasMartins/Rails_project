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

  def new 
    @recipe = Recipe.new 
    
  end 

  # após o form do new ser efetivado o rails
  # procura pela função create para salvar 
  # o objeto criado
  def create
    # strong params
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = Chef.find(2)

    if @recipe.save
      # flash uma especie de notificação
      flash[:success] = "Your Recipe was created Succesfully!"
      redirect_to recipe_index_path
    else
      render :new
    end
  end

  # só assim para possibilitar a criação
  # de um novo objeto
  private
    def recipe_params
      params.require(:recipe).permit(:name,:summary,:description)
    end
end

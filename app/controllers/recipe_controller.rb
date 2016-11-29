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

  def edit
    # find the recipe to edit
    @recipe = Recipe.find(params[:id])


  end

  def update
    # find the recipe to save
    @recipe = Recipe.find(params[:id])
    
    if @recipe.update(recipe_params)
      flash[:success] = "Your Recipe was updated Succesfully!"
      #back to recipe that just have been updated
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  #gerenciando o like/dislik
  def like
    @recipe = Recipe.find(params[:id])
    Like.create(like: params[:like], chef: Chef.first, recipe: @recipe)
    redirect_to :back # não fazer nenhuma ação de redirecionamento na pagina

  end

  # só assim para possibilitar a criação
  # de um novo objeto
  private
    def recipe_params
      params.require(:recipe).permit(:name,:summary,:description,:picture)
    end
end

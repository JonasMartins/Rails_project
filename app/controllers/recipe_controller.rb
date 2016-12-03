class RecipeController < ApplicationController
	before_action :set_recipe, only: [:like, :show, :edit, :update]
  # evitar que uma nova receita seja adicionada apenas digitando o link na barra
  before_action :require_user, except: [:show, :index] # apenas esses dois métodos não precisam de um 
  # usuário logada para poder acessa-los : OBS: ESSE MÉTODO ESTÁ EM APPLICATION CONTROLLER POR SER MUITO RECORRENTE....
  before_action :require_same_user, only: [:edit, :update]


  def index
=begin

  	Variavel de instancia usada na view index, 
  	usando o active record, nesse caso o all
  	onde a variavel @recipes é um array
  	com todos os objetos desse tipo
    
    
    Mostrando as receitas com mais likes primeiro... 
  	forma errada uma vez que mostrat muitas receitas por página 
    pode ser muito custoso para a aplicação, usamos de forma corrta
    o conceito de paginação com as gems : gem 'will_paginate' 
    gem 'bootstrap-will_paginate' para facilitar.

    @recipes = Recipe.all.sort_by{|likes| likes.thumbs_up_total}.reverse 

=end    
    # 4 recipes por página:
    @recipes = Recipe.all.paginate(page: params[:page], per_page: 4)  

  end

  def show
  	# Pausa o server ao de deparar com algum erro
  	# ex: ao clicar no link e o template não estiver
  	# presente o binding simplesmente para e entra
  	# na linha de comando do pry para maiores informações
  	# binding.pry  	
  	# params para receber o id do objeto a ser mostrado
  end

  def new 
    @recipe = Recipe.new 
    
  end 

  # após o form do new ser efetivado o rails
  # procura pela função create para salvar 
  # o objeto criado
  def create
    # strong params
    # desnecessário após os before_actions. chef = Chef.find(session[:chef_id]) if logged_in?
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = current_user # before_action cuida disso também....

    if @recipe.save
      # flash uma especie de notificação
      flash[:success] = "Your Recipe was created Succesfully!"
      
      redirect_to chef_path(chef) if logged_in?
    else
      render :new
    end
  end 

  def edit
    # find the recipe to edit
  end

  def update
    # find the recipe to save
    
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
    like = Like.create(like: params[:like], chef: current_user, recipe: @recipe) #current user curtiu. 
    if like.valid?
      flash[:success] = "Your voting was counting!"
    else
      flash[:danger] = "You can only like/dislike a recipe once!"
    end
    redirect_to :back # não fazer nenhuma ação de redirecionamento na pagina


  end

  # só assim para possibilitar a criação
  # de um novo objeto
  private
    def recipe_params
      params.require(:recipe).permit(:name,:summary,:description,:picture)
    end

    def set_recipe
      @recipe = Recipe.find(params[:id])
    end
    # a ordem do before_action é muito importante, netar que @ já é acessível a 
    # require_same_user apenas por conta da ordem estabelecida acima 
    def require_same_user
      if current_user != @recipe.chef
        flash[:danger] = "You can only edit your own profile"
        redirect_to root_path
      end
    end 

end

=begin
Harissa Lamb Steaks with Middle Eastern Baharat & Bulgur Wheat
A delicious roasted lamb!

Step 1:
Heat the oil in a large non-stick frying pan over a high heat. Sprinkle the lamb steaks with salt and pepper and cook, in batches, for 1-2 minutes on each side until just cooked through and tender. Put 2 lamb steaks on each plate and set aside. Keep warm.

Meanwhile, prepare the grains, firmly massage the pouch to separate the grains, then cut off the top with a scissors. Heat in the microwave (category E – 850W) for 2 minutes. Stand for 1 minute, then fluff up the grains with a fork.

Add the garlic and harissa to the pan that you’ve cooked the lamb in and cook for 1 minute, stirring.

To Serve:
Drizzle the lamb steaks with the harissa oil and scatter over the parsley. Divide the grains between the plates and squeeze a lemon wedge to each one to serve.

=end
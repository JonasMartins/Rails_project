class ChefsController < ApplicationController
  include ChefsHelper
	#antes de qualquer ação aqui dentro, executar esses métodos
	before_action :set_chef, only: [:edit, :update, :show]
	before_action :require_same_user, only: [:edit, :update] # apenas edit e update precisão do retorno true dessa ação
  # para poder serem executadas

	def new
		@chef = Chef.new
	  @countries = ChefsHelper::get_countries
  end

	def create
		@chef = Chef.create(chef_params)
		if @chef.save
			flash[:success] = "Your account has been created Succesfully!"
			# indo para pagina show de chef após ter criado uma conta em register
			session[:chef_id] = @chef.id
			
			redirect_to recipe_index_path
		else
			render 'new'
		end
	end
  
  def index
  	@chefs = Chef.all.paginate(page: params[:page], per_page: 3)
  end

  def edit
    @countries = ChefsHelper::get_countries
  end

  def update
  	if @chef.update(chef_params)
  		flash[:success] = "Your profile has been updated Succesfully!"
  		redirect_to chef_path(@chef) 
  	else
  		render 'edit'
  	end
  end

  def show
  	@recipes = @chef.recipes.paginate(page: params[:page], per_page: 3)
  end

  private 
  	def chef_params
  		params.required(:chef).permit(:chefname, :email, :password, :profile_picture, :full_name, :country, :web_site)
  	end
  	def set_chef
  		@chef = Chef.find(params[:id])  	
  	end
  	
  	def require_same_user
  		if current_user != @chef
  			flash[:danger] = "You can only edit your own profile"
  			redirect_to root_path
  		end
  	end	

end

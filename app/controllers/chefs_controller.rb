class ChefsController < ApplicationController

	def new
		@chef = Chef.new
	end

	def create
		@chef = Chef.create(chef_params)
		if @chef.save
			flash[:success] = "Your account has been created Succesfully!"
			redirect_to recipe_index_path
		else
			render 'new'
		end
	end
  
  def index
  	@chefs = Chef.all.paginate(page: params[:page], per_page: 3)
  end

  def edit
  	@chef = Chef.find(params[:id])

  end

  def update
  	@chef = Chef.find(params[:id])
  	if @chef.update(chef_params)
  		flash[:success] = "Your profile has been updated Succesfully!"
  		redirect_to recipe_index_path # depois mmuda para a página profile de cada chef
  	else
  		render 'edit'
  	end
  end

  def show
  	@chef = Chef.find(params[:id])
  	@recipes = @chef.recipes.paginate(page: params[:page], per_page: 3)
  end


  private 
  	def chef_params
  		params.required(:chef).permit(:chefname, :email, :password)
  	end

end

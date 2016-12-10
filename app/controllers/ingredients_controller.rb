class IngredientsController < ApplicationController
  before_action :require_user, except: [:show ] # para show, não preciso de required user
  # porem para todas as oitras ações sim
  def new
  	@ingredient = Ingredient.new
  end

  def show
    @ingredient = Ingredient.find(params[:id])
    @recipes = @ingredient.recipes.paginate(page: params[:page], per_page: 4)
  end


  def create
  	@ingredient = Ingredient.new(ingredient_params)
  	if @ingredient.save 
  		flash[:success] = "ingredient created succesfully"
  		redirect_to recipe_index_path
  	else
  		render 'new'
  	end

  end



  private
  	def ingredient_params
  		params.required(:ingredient).permit(:name)
		end
end

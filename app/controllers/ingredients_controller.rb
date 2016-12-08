class IngredientsController < ApplicationController
  def new
  	@ingredient = Ingredient.new
  end

  def show
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

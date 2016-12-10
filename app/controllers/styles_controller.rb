class StylesController < ApplicationController
  before_action :require_user, except: [:show ] # para show, não preciso de required user
  # porem para todas as oitras ações sim
  def new
  	@style = Style.new
  end

  def show
    @style = Style.find(params[:id])
    @recipes = @style.recipes.paginate(page: params[:page], per_page: 4)
  end

  def create
  	@style = Style.new(style_params)
  	if @style.save 
  		flash[:success] = "Style created succesfully"
  		redirect_to recipe_index_path
  	else
  		render 'new'
  	end

  end



  private
  	def style_params
  		params.required(:style).permit(:name)
		end
end

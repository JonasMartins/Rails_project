class StylesController < ApplicationController
  def new
  	@style = Style.new
  end

  def show
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

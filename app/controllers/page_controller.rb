class PageController < ApplicationController
  def home
  	chef = Chef.find(session[:chef_id]) if logged_in?
  	redirect_to chef_path(chef) if logged_in?
  end
end

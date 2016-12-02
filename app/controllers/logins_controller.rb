class LoginsController < ApplicationController
=begin
	Quando alguem loga, a informação inserida é guardada em uma
	entidade chamada session, e esse session guarda no browser,
	e o browser tem um cookie que armazena essa informação.
=end
  def new
  	# apenas renderiza o template de new para receber as informações
  end
  
  def create
  	# sempre uma boa pratica usar binding.pry para saber 
  	# quais parametros estão sendo envidos para essa ação
  	# ao digitar binding.pry e params no servidor para
  	# saber quais parametros estão sendo passados
  	chef = Chef.find_by(email: params[:email])
  	# saber se o e-mail é válido:
  	if chef && chef.authenticate(params[:password]) # segurança?
  		
  		# salvando o id do chef em session
  		session[:chef_id] = chef.id
  		flash[:success] = "You're logged in!"
  		redirect_to chef_path(chef) if logged_in? # redirecionando para a página perfil daquele chef
  	
  	else
  		flash.now[:danger] = "Something Wrong, Your email or password does not match!"
  		render 'new'
  	end
  end  

  def destroy
  	session[:chef_id] = nil
  	flash[:success] = "You have logged out"
  	redirect_to root_path
  end
end

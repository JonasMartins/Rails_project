class Chef < ActiveRecord::Base

	#### TENTANDO:heroku run rake db:migrate

	# antes de salvar, já adiciona a função
	# downcase na entrada
	
	# esse objeto tem muitas recipes
	# e em recipes adicionamos belongs_to chef....
	# relacionamentos após a alteração da tabela
	has_many :recipes
	has_many :likes
	before_save { self.email = email.downcase }

	validates :chefname, presence: true, length:
	 {minumum: 3, maximum: 40}
	#found at: http://emailregex.com/
	VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: 
	{maximum: 105},uniqueness: {case_sensitive: false}, 
	format: {with: VALID_EMAIL_REGEX}

	# => Dica:
	# => Adicionando mudanças a tabela usando comando rails:
	# => rails generate migration add_chef_id_to_recepies
	# => isso, faz com que a tabela chef seja adicionada
	# => uma coluna chamada chef_id, que depois usamos
	# => para referenciar recipes


	# => No arquivo criado adicionamos as instruçõs de
	# => alteração da tabela
	# => add_column :recipes, :chef_id, :integer
	# => adicione coluna, na tabela recipes
	# => com o titulo chef_id, do tipo integer
	# => simples!
	# => rake db:migrate 

end
 
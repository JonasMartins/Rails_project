class Recipe < ActiveRecord::Base
=begin
	/**
	 *	 rails generate model Recipe name:string summary:text description:text
	 *
	 * Isso vai gerar tanto a tabela quanto o model 
	 * para poder acessar os atributos da tabela
	 * sempre com essa regra, nome do Objeto, model
	 * em letra letra maiúscula primeiro e singular
	 * isso gera esssa classe e o arquivo migrate
	 * relacionado aquele objeto aquela tabela
	 *
	 * http://guides.rubyonrails.org/getting_started.html
	 *
	 * ctrl+f "generate model" para maiores detalhes 
	 *
	 * Notar que a tabela é criada no banco de dados, no 
	 * postgres recipes nessa notação no plural refernte
	 * a esse objeto.
	 *
	 * ápós isso basta usar o comando para gerar as migrações
	 * com: rake db:migrate isso cria os arquivos e 
	 * a tabela, executando o arquivo referente migration.rb
	 * referente ao comando acionado anteriormente
	 */
=end

# validations
validates :name, presence: true, length: {minumum: 5, maximum: 100}
validates :summary presence: true, length: {minumum: 10
maximum: 150}
validates :description presence: true, length: {minumum: 20
maximum: 300}

end

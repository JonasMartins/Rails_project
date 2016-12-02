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

# => Obs para isso, muitos pertencem a 1, logo
# => chef deve ser no singular
# => Obs: Video 26 mostra dicas no rails console 
# => para adicionar métodos interessantes após
# => a criação das relações, importante ver.
belongs_to :chef
has_many :likes
#Adicionar Origin? 
validates :chef_id , presence: true	
# validations
validates :name, presence: true, length: {minumum: 5, maximum: 300}
validates :summary, presence: true, length: {minumum: 10, maximum: 150}
validates :description, presence: true, length: { within: 20...5000 } 
# mode de preparo ilimitado..... OBS {is: 5} deve ser igual a 5 a entrada.....
# conveção da gem de upload de arquivos:
mount_uploader :picture, PictureUploader
validate :picture_size
# mater ordem por timestamp na apresentação do index mesmo usando o 
# gem de paginação que não provê essa funcinalidade
default_scope -> { order(updated_at: :desc) } # pegnado do mais novo
# forma de fazer por quantidade de likes:
# uma nova coluna para computar a quantidade de likes e depois especificamos
# esta coluna aqui ao invés de updated_at


# calculo de likes/dislkes
def thumbs_up_total
	self.likes.where(like: true).size
end

def thumbs_down_total
	self.likes.where(like: false).size
end


# Validation on the server side
private
	def picture_size
		if picture.size > 3.megabytes
			errors.add(:picture, "Image must be less than 3MB")
		end
	end


end

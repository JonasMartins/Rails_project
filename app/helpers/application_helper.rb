module ApplicationHelper
	require 'digest/md5'
=begin
	/**
	 *
	 *	Adicionar uma imagem do site gravaat a
	 * 	imagem do chef, uma vez que o email seja
	 *  válido e esteja cadastrado essa função vai retornar
	 *  o imgem referente ao email do chef que se encontra
	 *  no site gravatar, se não forem emils válidos
	 *  então irão aparecer um aimagem padrão.
	 */
=end
	def gravatar_for(chef, options = { size:80 })
		gravatar_id = Digest::MD5.hexdigest(chef.email.downcase)
		size = options[:size] #deixando do tamanho passado
		# no argumento, se não passar o padrão é 80
		#gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
		gravatar_url = "https://www.gravatar.com/avatar/#{gravatar_id}"
		#especificações do site
		image_tag(gravatar_url, alt: chef.chefname, class: "gravatar") # mesma coisa do php, com alt e uma classe própria

	end
end

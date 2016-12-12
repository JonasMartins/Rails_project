module ChefsHelper

	# Colocar todos os países aqui e pegar pela view
	@countries = Hash['Afghanistan' => '48/Afghanistan.png', 'Albania' => '48/Albania.png',
	'Algeria' => '48/Algeria.png', 'Andorra' => '48/Andorra.png', 'United Kingdom' => '48/United Kingdom(Great Britain).png']
	def self.get_countries
		return @countries
	end

end

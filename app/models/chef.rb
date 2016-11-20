class Chef < ActiveRecord::Base

	# antes de salvar, já adiciona a função
	# downcase na entrada
	
	before_save { self.email = email.downcase }
	
	validates :chefname, presence: true, length:
	 {minumum: 3, maximum: 40}
	#found at: http://emailregex.com/
	VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: 
	{maximum: 105},uniqueness: {case_sensitive: false}, 
	format: {with: VALID_EMAIL_REGEX}

end
 
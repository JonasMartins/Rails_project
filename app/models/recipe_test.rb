=begin
require "test_helper"

Esse arquivo estava causando o erro
para maiores informações basta : heroku logs
diagnostico: heroku ps:scale web=1
depois: heroku ps
para mostrar as informações 

class RecipeTest < ActiveSupport::TestCase

	def setup
		# create an objet to test
		@recipe = Recipe.new(name: "chiken parm", summary: "this is the best!", description: "heat oil, add onions, add tomato sauce, add chiken, cook for 20 minutes")

	end	

	test "recipe should be valid" do 
		assert @recipe.valid? #assert = assertions google this!
	end

	test "name should be present" do 
		@recipe.name = " "
		assert_not @recipe.valid?
	end

	test "name length should not be to short" do 
		@recipe.name = "aaaa"
		assert_not @recipe.valid?
	end

	test "name length should not be to long" do 
		@recipe.name = "a" * 100
		assert_not @recipe.valid?
	end

	test "summary should be present" do 
		@recipe.summary = " " 
		assert_not @recipe.valid?
	end
	
	test "summary length should not be to long" do 
		@recipe.summary = "a" * 100
		assert_not @recipe.valid?
	end
	test "summary length should not be to short" do 
		@recipe.summary = "a" * 9
		assert_not @recipe.valid?
	end

	test "description should be present" do 
		@recipe.description = " " 
		assert_not @recipe.valid?
	end
	
	test "description length should not be to long" do 
		@recipe.description = "a" * 300
		assert_not @recipe.valid?
	end
	test "description length should not be to short" do 
		@recipe.description = "a" * 19
		assert_not @recipe.valid?
	end


end	

=end
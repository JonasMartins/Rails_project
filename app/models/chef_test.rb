=begin
require "test_helper"

class ChefTest < ActiveSupport::TestCase

	def setup
		# create an objet to test
		@chef = Chef.new(chefname: "john", email: "john@example.com")

	end	

	test "chef should be valid" do 
		assert @chef.valid?
	end

	test "chefname should be present" do 
		@chef.chefname = " "
		assert_not @chef.valid?
	end
	
	test "chefname length should not be to long" do 
		@chef.chefname = "a" * 41
		assert_not @chef.valid?
	end
	
	test "chefname length should not be to short" do 
		@chef.chefname = "aa"
		assert_not @chef.valid?
	end

	test "email should be present" do 
		@chef.email = " "
		assert @chef.valid?
	end

	test "email should be within bounds" do 
		@chef.chefname = "a" * 101 + "@example.com"
		assert @chef.valid?
	end

	test "email address should be unique" do
		dup_chef = @chef.dup
		dup_chef.email = @chef.email.upcase
		@chef.save
		assert_not dup_chef.valid?	
	end


	test "email address should accept valid addresses" do
		valid_addresses = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com first.last@eem.au laura+joe@monk.cm]
		valid_addresses.each do |v|
			@chef.email = v
			assert @chef.valid?, '#{v.inspect} should be valid'
		end
	end

	test "email address should reject invalid addresses" do
		invalid_addresses = %w[user@example,com user_at_eee.org user.name@example. eee@i_am_.com foo@ee+aar.com]
		invalid_addresses.each do |i|
			@chef.email = i
			assert_not @chef.valid?, '#{v.inspect} should be invalid'
		end
	end


end	
=end
class AddFieldsToChefs < ActiveRecord::Migration
  def change
  		add_column :chefs, :full_name, :string
  		add_column :chefs, :web_site, :string
  		add_column :chefs, :country, :string
  end
end

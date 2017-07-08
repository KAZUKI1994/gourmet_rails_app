class AddColumnurlTorestaurants < ActiveRecord::Migration
  def change
		add_column :restaurants, :url, :string
		remove_column :posts, :url, :string
  end
end

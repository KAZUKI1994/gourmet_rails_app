class AddTelnumberToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :telnumber, :string
  end
end

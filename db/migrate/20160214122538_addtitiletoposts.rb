class Addtitiletoposts < ActiveRecord::Migration
  def change
    add_column :posts, :titile, :string
  end
end

class ChangeTitileToPosts < ActiveRecord::Migration
  def change
		def up
		  change_column :posts, :title, :string
		end

		def down
	    change_column :posts, :titile, :string
		end
  end
end

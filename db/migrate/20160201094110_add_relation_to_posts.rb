class AddRelationToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :relation, :string
  end
end

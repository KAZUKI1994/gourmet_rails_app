class AddColumnNicknameToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :author_name, :string
    add_column :posts, :author_college, :sring
    add_column :posts, :author_faculty, :string
    add_column :posts, :author_gender, :string
    add_column :posts, :author_grade, :string
  end
end

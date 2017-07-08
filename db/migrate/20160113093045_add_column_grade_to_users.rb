class AddColumnGradeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :grade, :string
    add_column :users, :gender, :string
  end
end

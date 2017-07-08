class AddColumnNicknameToUsers < ActiveRecord::Migration
  def change
		add_column :users, :nickname, :string
		add_column :users, :college, :string
		add_column :users, :faculty, :string
  end
end

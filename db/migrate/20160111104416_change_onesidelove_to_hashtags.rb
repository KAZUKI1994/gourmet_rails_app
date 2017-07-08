class ChangeOnesideloveToHashtags < ActiveRecord::Migration
  def change
		change_column :hashtags, :couple, :string
		change_column :hashtags, :firstdate, :string
		change_column :hashtags, :onesidelove, :string
		change_column :hashtags, :confession, :string
		change_column :hashtags, :lunch, :string
		change_column :hashtags, :cafe, :string
		change_column :hashtags, :dinner, :string
		change_column :hashtags, :aniversary, :string
		change_column :hashtags, :oneyear_ani, :string
		change_column :hashtags, :onemonth_ani, :string
		change_column :hashtags, :xmas, :string
		change_column :hashtags, :valentine, :string
		change_column :hashtags, :whiteday, :string
  end
end

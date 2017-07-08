class AddHashtagIdToPost < ActiveRecord::Migration
  def change
    add_reference :posts, :hashtag, index: true, foreign_key: true
  end
end

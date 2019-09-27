class AddFieldsToPosts < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :user, foreign_key: true
    add_column :posts, :content, :text
    add_column :posts, :image_link, :text
  end
end

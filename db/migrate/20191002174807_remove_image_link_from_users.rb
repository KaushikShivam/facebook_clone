class RemoveImageLinkFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :image_link
  end
end

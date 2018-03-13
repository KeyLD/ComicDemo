class DropComicIdFromComments < ActiveRecord::Migration[5.1]
  def change
    remove_index :comments, :comic_id
  end
end

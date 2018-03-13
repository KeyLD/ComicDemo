class AddImageToComics < ActiveRecord::Migration[5.1]
  def change
    add_column :comics, :image, :string
  end
end

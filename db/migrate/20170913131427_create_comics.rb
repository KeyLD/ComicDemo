class CreateComics < ActiveRecord::Migration[5.1]
  def change
    create_table :comics do |t|
      t.string :name
      t.string :introduce
      t.date :time
      t.integer :type_id
      t.integer :country_id
      t.integer :theme_id

      t.timestamps
    end
  end
end

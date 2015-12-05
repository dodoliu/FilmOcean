class CreateFilmCategories < ActiveRecord::Migration
  def change
    create_table :film_categories do |t|
      t.string :categoy, limit: 10

      t.timestamps null: false
    end
    add_index :film_categories, :categoy, unique: true
  end
end

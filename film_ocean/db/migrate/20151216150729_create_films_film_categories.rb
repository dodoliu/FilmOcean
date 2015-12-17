class CreateFilmsFilmCategories < ActiveRecord::Migration
  def change
    create_table :films_film_categories do |t|
    	t.integer :film_id
    	t.integer :film_category_id

    	t.timestamps null: false
    end
    add_index :films_film_categories, [:film_id, :film_category_id]
  end
end

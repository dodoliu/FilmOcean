class CreateFilmsFilmCategories < ActiveRecord::Migration
  def change
    create_table :film_categories_films, id: false do |t|
    	t.belongs_to :film
    	t.belongs_to :film_category
    end
    add_index :film_categories_films, [:film_id, :film_category_id]
  end
end

class CreateFilmsFilmDirectors < ActiveRecord::Migration
  def change
    create_table :film_directors_films, id: false do |t|
    	t.belongs_to :film
    	t.belongs_to :film_director
    end
    add_index :film_directors_films, [:film_id, :film_director_id]
  end
end

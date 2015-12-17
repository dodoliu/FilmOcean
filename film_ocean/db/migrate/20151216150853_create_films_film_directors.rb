class CreateFilmsFilmDirectors < ActiveRecord::Migration
  def change
    create_table :films_film_directors do |t|
    	t.integer :film_id
    	t.integer :film_director_id

    	t.timestamps null: false
    end
    add_index :films_film_directors, [:film_id, :film_director_id]
  end
end

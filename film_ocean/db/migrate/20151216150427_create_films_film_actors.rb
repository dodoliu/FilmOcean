class CreateFilmsFilmActors < ActiveRecord::Migration
  def change
    create_table :film_actors_films, id: false do |t|
    	t.belongs_to :film
    	t.belongs_to :film_actor
    end
    add_index :film_actors_films, [:film_id, :film_actor_id]
  end
end

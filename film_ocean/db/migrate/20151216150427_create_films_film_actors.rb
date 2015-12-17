class CreateFilmsFilmActors < ActiveRecord::Migration
  def change
    create_table :films_film_actors do |t|
    	t.integer :film_id
    	t.integer :film_actor_id

    	t.timestamps null: false
    end
    add_index :films_film_actors, [:film_id, :film_actor_id]
  end
end

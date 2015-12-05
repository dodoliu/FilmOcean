class CreateFilmActors < ActiveRecord::Migration
  def change
    create_table :film_actors do |t|
      t.string :actor, limit: 50

      t.timestamps null: false
    end
    add_index :film_actors, :actor, unique: true
  end
end

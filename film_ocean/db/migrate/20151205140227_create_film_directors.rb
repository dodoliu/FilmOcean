class CreateFilmDirectors < ActiveRecord::Migration
  def change
    create_table :film_directors do |t|
      t.string :director, limit: 50

      t.timestamps null: false
    end
    add_index :film_directors, :director, unique: true
  end
end

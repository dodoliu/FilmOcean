class CreateFilmSources < ActiveRecord::Migration
  def change
    create_table :film_sources do |t|
      t.string :source
      t.string :source_url, limit: 500

      t.timestamps null: false
    end
    add_index :film_sources, :source, unique: true
  end
end

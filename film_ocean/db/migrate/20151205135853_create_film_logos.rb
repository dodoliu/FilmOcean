class CreateFilmLogos < ActiveRecord::Migration
  def change
    create_table :film_logos do |t|
      t.string :logo_url, limit: 500

      t.timestamps null: false
    end
  end
end

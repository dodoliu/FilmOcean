class CreateFilmLogos < ActiveRecord::Migration
  def change
    create_table :film_logos do |t|
      t.string :logo_url, limit: 500
      t.belongs_to :film

      t.timestamps null: false
    end
  end
end

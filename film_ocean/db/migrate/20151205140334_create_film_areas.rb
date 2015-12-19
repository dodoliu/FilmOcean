class CreateFilmAreas < ActiveRecord::Migration
  def change
    create_table :film_areas do |t|
      t.string :area, limit: 15
      t.belongs_to :film

      t.timestamps null: false
    end
    add_index :film_areas, :area, unique: true
  end
end

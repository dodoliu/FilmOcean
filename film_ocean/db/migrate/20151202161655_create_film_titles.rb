class CreateFilmTitles < ActiveRecord::Migration
  def change
    create_table :film_titles do |t|
      t.string :chinese_name
      t.string :english_name
      t.boolean :status

      t.timestamps null: false
    end
  end
end

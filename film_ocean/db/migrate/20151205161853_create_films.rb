class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.integer :film_title_id
      t.string :chinese_name
      t.string :english_name
      t.integer :film_logo_id
      t.integer :film_area_id
	  t.integer :film_director_id
	  t.integer :film_category_id
	  t.integer :film_introduction_id
	  t.integer :film_source_id
	  t.integer :film_download__id
	  t.integer :film_actor_id
	  t.integer :film_language
	  t.datetime :make_date
	  t.integer :show_type
	  t.integer :click_rate
	  t.integer :grade
	  t.string :duration, limit: 20

      t.timestamps null: false
    end
    add_index :films, [:chinese_name,:english_name], unique: true
  end
end
class CreateFilmTitles < ActiveRecord::Migration
  def change
    create_table :film_titles do |t|
      t.string :chinese_name
      t.string :english_name
      t.boolean :status
      t.belongs_to :film

      t.timestamps null: false
    end
    add_index :film_titles, [:chinese_name,:english_name], unique: true
  end
end

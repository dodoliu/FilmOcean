class CreateFilmIntroductions < ActiveRecord::Migration
  def change
    create_table :film_introductions do |t|
      t.string :introduction, limit: 20
      t.belongs_to :film

      t.timestamps null: false
    end
  end
end

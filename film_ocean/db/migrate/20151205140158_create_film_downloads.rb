class CreateFilmDownloads < ActiveRecord::Migration
  def change
    create_table :film_downloads do |t|
      t.string :download_url, limit: 500
      t.string :download_contact_url, limit: 500
      t.string :expand, limit: 50

      t.timestamps null: false
    end
  end
end

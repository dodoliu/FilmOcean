class CreateFileLogos < ActiveRecord::Migration
  def change
    create_table :file_logos do |t|
      t.string :logo_url, limit: 500

      t.timestamps null: false
    end
  end
end

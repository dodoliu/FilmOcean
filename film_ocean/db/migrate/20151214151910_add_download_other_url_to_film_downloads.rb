class AddDownloadOtherUrlToFilmDownloads < ActiveRecord::Migration
  def change
  	add_column :film_downloads, :download_other_url, :string, limit: 500
  end
end

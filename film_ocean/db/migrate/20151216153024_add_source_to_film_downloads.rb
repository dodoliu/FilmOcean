class AddSourceToFilmDownloads < ActiveRecord::Migration
  def change
  	#来源 1: llduang, 2: 其他
  	add_column :film_downloads, :source, :integer
  end
end

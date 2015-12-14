class RenameCategoyFromFilmCategories < ActiveRecord::Migration
  def change
  	rename_column :film_categories, :categoy, :category
  end
end

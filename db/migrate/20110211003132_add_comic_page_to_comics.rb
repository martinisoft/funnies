class AddComicPageToComics < ActiveRecord::Migration
  def self.up
    add_column :comics, :comic_page, :string
  end

  def self.down
    remove_column :comics, :comic_page
  end
end

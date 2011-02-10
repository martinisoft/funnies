class AddXpathToComic < ActiveRecord::Migration
  def self.up
    add_column :comics, :xpath_title, :string
    add_column :comics, :xpath_image, :string
    remove_column :comics, :feed_url
  end

  def self.down
    remove_column :comics, :xpath_image
    remove_column :comics, :xpath_title
    add_column :comics, :feed_url, :string
  end
end

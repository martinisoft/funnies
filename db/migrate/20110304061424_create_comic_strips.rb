class CreateComicStrips < ActiveRecord::Migration
  def self.up
    create_table :comic_strips do |t|
      t.references :comic
      t.string :title
      t.string :comic_image
      t.string :md5_hash
      t.timestamps
    end
  end

  def self.down
    drop_table :comic_strips
  end
end

class CreateSuggestions < ActiveRecord::Migration
  def self.up
    create_table :suggestions do |t|
      t.references :user
      t.string :name
      t.string :website
      t.text :reason
      t.text :rejected_reason
      t.string :state
      t.timestamps
    end
  end

  def self.down
    drop_table :suggestions
  end
end

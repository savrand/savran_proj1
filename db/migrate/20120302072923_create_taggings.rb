class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.integer :tag_id
      t.integer :picture_id

      t.timestamps
    end
    add_index :taggings, :tag_id
    add_index :taggings, :picture_id
    add_index :taggings, [:tag_id, :picture_id], :unique => true
  end
end

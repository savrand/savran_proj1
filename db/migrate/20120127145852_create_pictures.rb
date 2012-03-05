class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.has_attached_file :picture   
     t.timestamps     
    end
  end
end

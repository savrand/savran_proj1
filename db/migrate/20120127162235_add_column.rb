class AddColumn < ActiveRecord::Migration
  def up
   add_column :pictures, :name, :string
  end

  def down
  end
end

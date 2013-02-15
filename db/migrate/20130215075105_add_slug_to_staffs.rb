class AddSlugToStaffs < ActiveRecord::Migration
  def up
    add_column :staffs, :slug, :string
    add_index :staffs, :slug, unique: true
    # For update slugs
    Staff.find_each(&:save)
  end

  def down
    remove_column :staffs, :slug
    remove_index :staffs, :slug
  end
end

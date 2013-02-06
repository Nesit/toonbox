class CreatePublicImages < ActiveRecord::Migration
  def change
    create_table :public_images do |t|
      t.attachment :attachment
      t.timestamps
    end
  end
end

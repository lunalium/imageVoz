class CreateHinhvozs < ActiveRecord::Migration
  def change
    create_table :hinhvozs do |t|
      t.string :page
      t.string :image
      t.string :des

      t.timestamps
    end
  end
end

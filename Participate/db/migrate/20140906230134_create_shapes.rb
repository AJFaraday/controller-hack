class CreateShapes < ActiveRecord::Migration
  def change
    create_table :shapes do |t|
      t.string :name
      t.integer :xpos
      t.integer :ypos
      t.float :size
      t.boolean :active

      t.timestamps
    end
  end
end

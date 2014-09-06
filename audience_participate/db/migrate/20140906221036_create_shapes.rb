class CreateShapes < ActiveRecord::Migration
  def change
    create_table :shapes do |t|
      t.string :name
      t.boolean :active
      t.integer :xpos
      t.integer :ypos
      t.float :size

      t.timestamps
    end
  end
end

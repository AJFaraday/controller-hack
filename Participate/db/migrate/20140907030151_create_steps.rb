class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.integer :position
      t.integer :drum_id

      t.timestamps
    end
  end
end

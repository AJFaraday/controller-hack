class CreateDrums < ActiveRecord::Migration
  def change
    create_table :drums do |t|
      t.string :name

      t.timestamps
    end
  end
end

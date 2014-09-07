class AddPassedToShape < ActiveRecord::Migration
  def change
    add_column :shapes, :passed, :boolean
  end
end

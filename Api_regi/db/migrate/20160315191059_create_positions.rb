class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.integer :position_id
      t.string :location_name, :limit => 30
      t.float :longitude
      t.float :latitude

      t.timestamps null: false
    end
  end
end

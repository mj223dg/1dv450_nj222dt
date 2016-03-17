class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.text :description
      t.references :positions
      t.references :creators
      t.integer :creator_id
      t.integer :position_id
      
      t.timestamps null: false
    end
  end
end

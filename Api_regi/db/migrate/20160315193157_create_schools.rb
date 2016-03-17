class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.text :description
      t.references :position, index: true
      t.references :creator, index: true
      
      t.timestamps null: false
    end
  end
end

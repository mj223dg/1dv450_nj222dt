class CreateApis < ActiveRecord::Migration
  def change
    create_table :apis do |t|
      t.string :name
      t.string :api_key
      t.references :user, index: true, foreign_key:true
      
      t.timestamps null: false
    end
  end
end

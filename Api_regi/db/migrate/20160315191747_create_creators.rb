class CreateCreators < ActiveRecord::Migration
  def change
    create_table :creators do |t|
      t.integer :creator_id

      t.timestamps null: false
    end
  end
end

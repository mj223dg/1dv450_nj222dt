class CreateCreators < ActiveRecord::Migration
  def change
    create_table :creators do |t|
      t.string :email

      t.timestamps null: false
    end
  end
end

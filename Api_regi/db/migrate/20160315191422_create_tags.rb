class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name, :limit => 30

      t.timestamps null: false
    end
  end
end

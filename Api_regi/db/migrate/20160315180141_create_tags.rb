class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :tag_id
      t.string :tag_name, :limit => 30
    end
  end
end

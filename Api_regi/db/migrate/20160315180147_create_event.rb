class CreateEvent < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :event_id
      t.references :positions
      t.string :description
    end
  end
end

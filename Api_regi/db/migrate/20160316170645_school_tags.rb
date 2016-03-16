class SchoolTags < ActiveRecord::Migration
  def change
    create_table :schools_tags do |t|
      t.belongs_to :school, index: true
      t.belongs_to :tag, index: true
    end
  end
end

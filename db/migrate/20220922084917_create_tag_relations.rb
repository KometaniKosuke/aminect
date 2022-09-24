class CreateTagRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_relations do |t|
      t.integer :tag1_id
      t.integer :tag2_id
      t.float :degree
    end
  end
end

class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.references :user
      t.string :content
      t.timestamps
    end
  end
end

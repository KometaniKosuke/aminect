class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.integer :from_id
      t.integer :to_id
      t.timestamps
    end
  end
end

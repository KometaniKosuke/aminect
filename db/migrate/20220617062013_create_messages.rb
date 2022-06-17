class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :text
      t.timestamps :date
      t.references :user
      t.references :room
    end
  end
end

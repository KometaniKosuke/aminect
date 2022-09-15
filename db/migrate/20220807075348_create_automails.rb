class CreateAutomails < ActiveRecord::Migration[5.2]
  def change
    create_table :automails do |t|
      t.references :user
      t.string :email

      t.timestamps
    end
  end
end

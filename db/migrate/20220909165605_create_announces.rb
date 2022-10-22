class CreateAnnounces < ActiveRecord::Migration[5.2]
  def change
    create_table :announces do |t|
      t.references :user
      t.string :title
      t.string :text
      t.string :url
      t.string :url_title
      t.timestamps
    end
  end
end

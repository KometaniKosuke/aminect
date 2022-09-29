class CreateUserTags < ActiveRecord::Migration[5.2]
  def change
    create_table :user_tags do |t|
      t.references :user
      t.references :tag
      # t.string :tag_image
    end
  end
end

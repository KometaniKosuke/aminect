class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :sex  # 1->男性、2->女性、3->指定なし
      t.string :birthplace
      t.string :undergraduate
      t.integer :grade
      t.string :comment
      t.string :email
      t.string :twitter
      t.string :instagram
      t.string :identifier
      t.boolean :agreement
      t.timestamps
    end
  end
end

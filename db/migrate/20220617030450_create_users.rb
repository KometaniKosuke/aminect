class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.integer :sex  # 1->男性、2->女性、3->指定なし
      t.string :birthplace
      t.string :undergraduate
    end
  end
end

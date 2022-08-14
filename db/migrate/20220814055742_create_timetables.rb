class CreateTimetables < ActiveRecord::Migration[5.2]
  def change
    create_table :timetables do |t|
      t.references :user
      t.integer :mon1, default: 0 # 0→空き、1→授業
      t.integer :mon2, default: 0
      t.integer :mon3, default: 0
      t.integer :mon4, default: 0
      t.integer :mon5, default: 0
      t.integer :tue1, default: 0
      t.integer :tue2, default: 0
      t.integer :tue3, default: 0
      t.integer :tue4, default: 0
      t.integer :tue5, default: 0
      t.integer :wed1, default: 0
      t.integer :wed2, default: 0
      t.integer :wed3, default: 0
      t.integer :wed4, default: 0
      t.integer :wed5, default: 0
      t.integer :thu1, default: 0
      t.integer :thu2, default: 0
      t.integer :thu3, default: 0
      t.integer :thu4, default: 0
      t.integer :thu5, default: 0
      t.integer :fri1, default: 0
      t.integer :fri2, default: 0
      t.integer :fri3, default: 0
      t.integer :fri4, default: 0
      t.integer :fri5, default: 0
    end
  end
end

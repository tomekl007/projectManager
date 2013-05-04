class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.date :deadline

      t.timestamps
    end
  end

  def down
    drop_table :tasks
  end
end

class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.boolean :active, default: false
      t.belongs_to :member, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end

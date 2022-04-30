class RemoveColumnActiveFromTasks < ActiveRecord::Migration[6.1]
  def change
    remove_column :tasks, :active
  end
end

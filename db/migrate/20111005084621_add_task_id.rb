class AddTaskId < ActiveRecord::Migration
  def self.up
    add_column :tasks, :task_id, :integer
  end

  def self.down
    remove_column :tasks, :task_id
  end
end

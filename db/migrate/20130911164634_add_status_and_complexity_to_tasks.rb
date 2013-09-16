class AddStatusAndComplexityToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :status, :integer
    add_column :tasks, :complexity, :integer
  end
end

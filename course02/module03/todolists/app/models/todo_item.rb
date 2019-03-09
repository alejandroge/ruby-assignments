class TodoItem < ActiveRecord::Base
  def self.completed_todos_count
    TodoItem.where(completed: true).count
  end
end

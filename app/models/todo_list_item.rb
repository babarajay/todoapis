class TodoListItem < ApplicationRecord
  belongs_to :todo_list

  after_save :update_todo_list

  def complete
    update(completed: true)
  end

  private
    def update_todo_list
      todo_list.update_completed if completed && completed_changed?
    end
end

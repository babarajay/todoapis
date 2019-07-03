module Mutations
  class AddItemToTodoList < GraphQL::Schema::RelayClassicMutation
    field :todo_list, Types::TodoListType, null: true
    field :errors, [String], null: false

    argument :todo_list_id, ID, required: true
    argument :title, String, required: true

    def resolve(todo_list_id:, title:)
      todo_list = TodoList.find_by(id: todo_list_id)
      item = todo_list.todo_list_items.build(title: title)
      if item.save
        {todo_list: todo_list, errors: []}
      else
        {todo_list: nil, errors: item.errors.full_messages}
      end
    end
  end
end

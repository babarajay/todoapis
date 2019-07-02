module Mutations
  class UpdateTodoList < GraphQL::Schema::RelayClassicMutation
    # Fields tobe sent
    field :todo_list, Types::TodoListType, null: true
    field :errors, [String], null: false

    argument :id, ID, required: true
    argument :title, String, required: true
    argument :description, String, required: false

    def resolve(id:, title:, description:)
      todo_list = TodoList.find_by(id: id)
      if todo_list.update_attributes(title: title, description: description)
        {
          todo_list: todo_list,
          errors: []
        }
      else
        {
          todo_list: nil,
          errors: todo_list.errors.full_messages
        }
      end
    end
  end
end

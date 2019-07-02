module Mutations
  class CreateTodoList < GraphQL::Schema::RelayClassicMutation
    # Fields tobe sent
    field :todo_list, Types::TodoListType, null: true
    field :errors, [String], null: false

    # Arguments tobe received
    argument :title, String, required: true
    argument :description, String, required: false

    def resolve(title: , description:)
      todo_list = context[:current_user].todo_lists.build(title: title, description: description)
      if todo_list.save
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

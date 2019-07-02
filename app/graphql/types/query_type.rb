module Types
  class QueryType < Types::BaseObject
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    field :todo_lists, [Types::TodoListType], null: false
    def todo_lists
      context[:current_user].todo_lists
    end

    field :todo_list, Types::TodoListType, null: true do
      argument :id, ID, required: true
    end
    def todo_list(id:)
      TodoList.find(id)
    end
  end
end

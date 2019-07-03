module Types
  class TodoListType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :description, String, null: true
    field :todoListItems, [Types::TodoListItemType], null: true
  end
end

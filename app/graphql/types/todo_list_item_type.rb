module Types
  class TodoListItemType < Types::BaseObject
    field :title, String, null: true
    field :completed, Boolean, null: true
  end
end

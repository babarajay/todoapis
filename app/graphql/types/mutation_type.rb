module Types
  class MutationType < Types::BaseObject
    field :userLogin, mutation: Mutations::UserLogin
    field :addItemToTodoList, mutation: Mutations::AddItemToTodoList
    field :updateTodoList, mutation: Mutations::UpdateTodoList
    field :createTodoList, mutation: Mutations::CreateTodoList
  end
end

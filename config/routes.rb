Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "graphql#execute"
  end
  post "/graphql", to: "graphql#execute"
  scope :api, defaults: { format: :json } do
    devise_for :users, controllers: { sessions: :sessions }, path_names: { sign_in: :login }

    # resources :user, only: :show
    # resources :todo_lists, path: "todos" do
    #   resources :todo_list_items, path: "items" do
    #     member do
    #       put :complete
    #     end
    #   end
    # end
  end
end

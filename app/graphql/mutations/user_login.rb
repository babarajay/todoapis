module Mutations
  class UserLogin < GraphQL::Schema::RelayClassicMutation
    argument :email, String, required: true
    argument :password, String, required: true

    field :token, String, null: true
    field :name, String, null: true
    field :email, String, null: true

    def resolve(email:, password:)
      user = User.find_by(email: email)
      return unless user
      return unless user.valid_password?(password)

      {
        name: "#{user.first_name} #{user.last_name}",
        token: user.generate_jwt_token,
        email: user.email
      }
    end
  end
end

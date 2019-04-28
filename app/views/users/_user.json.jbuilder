json.(user, :id, :email, :first_name, :last_name)
json.token user.generate_jwt_token if controller_name == "sessions"
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates(
    :first_name,
    presence: true
  )

  validates(
    :last_name,
    presence: true
  )

  has_many :todo_lists

  def generate_jwt_token
    JWT.encode(
      { id: id, exp: 60.days.from_now.to_i },
      Rails.application.secrets.secret_key_base
    )
  end

  def self.verify_token(token)
    result = JWT.decode(token, Rails.application.secrets.secret_key_base)
    return nil if result[0]["id"].blank?
    User.find_by(id: result[0]["id"])
  end
end

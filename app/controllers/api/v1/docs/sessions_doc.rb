module Api::V1::Docs::SessionsDoc
  extend Apipie::DSL::Concern

  def_param_group :user do
    param :name, String, 'Name of the user'
    param :nickname, String, 'Nickname of the user'
    param :email, String, 'User email'
    param :password, String, 'User password'
    param :password_confirmation, String, 'User password confirmation'
  end
  api :POST, '/auth/user/sign_in', 'Login a user'
  param_group :user

  example %q(
            Request:
            {
              "email":"amber5@email.com",
              "password":"password",
              "password_confirmation":"password"

            }

            Response:
            {
              "status":"success",
              "data":
                { "id":5,
                  "email":"amber5@email.com",
                  "provider":"email",
                  "gender":null,"uid":
                  "amber5@email.com",
                  "name":"Amber",
                  "nickname":"Ambie",
                  "image":"image.png",
                  "date_of_birth":null,
                  "city":null
                }
            }
  )

  def create
    super
  end
end
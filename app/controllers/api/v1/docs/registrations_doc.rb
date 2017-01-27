module Api::V1::Docs::RegistrationsDoc
  extend Apipie::DSL::Concern

  def_param_group :user do
    param :name, String, 'Name of the user'
    param :nickname, String, 'Nickname of the user'
    param :email, String, 'User email'
    param :password, String, 'User password'
    param :password_confirmation, String, 'User password confirmation'
  end
  api :POST, '/auth/user', 'Create a user'
  param_group :user

  example %q(
            Request:
            {
              "name":"Amber",
              "nickname": "baller",
              "email":"amber5@email.com",
              "password":"password",
              "password_confirmation":"password"
              "image":"image.png"

            }

            Response:
            {
              "status":"success",
              "data":
                {
                  "id":5,
                  "provider":"email",
                  "uid":"amber5@email.com",
                  "name":"Amber",
                  "nickname":"baller",
                  "image":"image.png",
                  "email":"amber5@email.com",
                  "created_at":"2017-01-25T13:40:28.171Z",
                  "updated_at":"2017-01-25T13:40:28.171Z"
                }
            }
  )

  def create
    super
  end
end
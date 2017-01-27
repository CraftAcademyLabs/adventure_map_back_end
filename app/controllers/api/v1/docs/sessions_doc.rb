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

            Headers:
            {
              "X-Frame-Options"=>"SAMEORIGIN",
              "X-XSS-Protection"=>"1; mode=block",
              "X-Content-Type-Options"=>"nosniff",
              "Content-Type"=>"application/json; charset=utf-8",
              "access-token"=>"xXIwMG3yBOzxUF5S5CLGgg",
              "token-type"=>"Bearer",
              "client"=>"HcjE_K4u0TLWVQZ9UODHgw",
              "expiry"=>"1486741920",
              "uid"=>"email@email.com",
              "Vary"=>"Origin",
              "ETag"=>"W/\"3b5861d8ca94de88953745ad7e17e502\"",
              "Cache-Control"=>"max-age=0, private, must-revalidate",
              "X-Request-Id"=>"9de4307d-ddec-45b2-a387-55848662e38a",
              "X-Runtime"=>"0.273076",
              "Content-Length"=>"194"
            }
  )

  def create
    super
  end
end
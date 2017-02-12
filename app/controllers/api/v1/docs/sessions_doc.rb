module Api::V1::Docs::SessionsDoc
  extend Apipie::DSL::Concern

  def_param_group :user do
    param :name, String, 'Name of the user'
    param :nickname, String, 'Nickname of the user'
    param :email, String, 'User email'
    param :password, String, 'User password'
    param :password_confirmation, String, 'User password confirmation'
    param :image, String, 'User profile picture'
    param :date_of_birth, String, 'User birthday'
    param :city, String, 'User city'
  end
  api :POST, '/auth/user/sign_in', 'Login a user'
  description <<-EOF
    Logs in a User. \n
    Authenticates a User and returns credentials in headers.
  EOF
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
              "access-token"=>"xXIwMG3yBOzxUF5S5CLGgg",
              "token-type"=>"Bearer",
              "client"=>"HcjE_K4u0TLWVQZ9UODHgw",
              "expiry"=>"1486741920",
              "uid"=>"email@email.com"
            }
  )

  def create
    super
  end

  api :DELETE, '/auth/user/sign_out', 'Logout a user'
  description <<-EOF
    Logs out a User. \n
  EOF

  example %q(
              Request:
               {
                }
              Response:
              {
                "success": true
              }
              Headers:
              {
                "access-token"=>"xXIwMG3yBOzxUF5S5CLGgg",
                "token-type"=>"Bearer",
                "client"=>"HcjE_K4u0TLWVQZ9UODHgw",
                "expiry"=>"1486741920",
                "uid"=>"email@email.com"
              }

          )
  def destroy
    super
  end
end
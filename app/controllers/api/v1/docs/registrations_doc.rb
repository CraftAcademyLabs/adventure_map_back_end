module Api::V1::Docs::RegistrationsDoc
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
    param :interest_list, Array, 'User Interests'
  end
  api :POST, '/auth', 'Create a user'
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
              "interest_list":"Snow mobiling, Mountain biking"
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
                  "interest_list":[
                    "Mountain biking",
                    "Snow mobiling"
                  ]
                }
            }
  )
  def create
    super
  end


  api :PUT, '/auth', 'Update a user'
  param_group :user

  example %q(
            Request:
            {
              "nickname": "20 inch blades"

            }
            Headers:
            {
              "access-token"=>"xXIwMG3yBOzxUF5S5CLGgg",
              "token-type"=>"Bearer",
              "client"=>"HcjE_K4u0TLWVQZ9UODHgw",
              "expiry"=>"1486741920",
              "uid"=>"email@email.com"
            }

            Response:
            {
              "status":"success",
              "data":
                {
                  "id":5,
                  "provider":"email",
                  "uid":"amber5@email.com",
                  "email":"amber5@email.com",
                  "name":"Amber",
                  "nickname":"20 inch blades",
                  "image":"a_new_image.png",
                  "date_of_birth":null
                  "city":null,
                  "interest_list":[
                    "Mountain biking",
                    "Snow mobiling"
                  ]
                }
            }
            Headers:
            {
              "X-Frame-Options"=>"SAMEORIGIN",
              "X-XSS-Protection"=>"1; mode=block",
              "X-Content-Type-Options"=>"nosniff",
              "Content-Type"=>"application/json; charset=utf-8",
              "access-token"=>"xXIwMG3yBOzxUF5S5CLG23lj",
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

  description 'To update user profile, one needs to include five items in the headers: access-token, expiry, token-type, uid, client. These are obtained when the user signs in. Each request generates a new set of tokens, so they will need to be read and sent back for future requests. In Postman, headers are obtained by first signing in and accessing the "Headers" that are returned.'

  def update
    super
  end
end

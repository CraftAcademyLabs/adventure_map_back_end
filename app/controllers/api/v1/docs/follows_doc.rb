module Api::V1::Docs::FollowsDoc
  extend Apipie::DSL::Concern

  api :POST, '/follows', 'Follow a user '
  description 'You need to provide \'user_id\' for the user to be followed in the params with the request'
  example %q(
            Request:
            {
              "user_id":"12",
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

            Response:
            {
              "status":"success",
            }
  )

  def create
    super
  end

  api :DELETE,  '/follows/:id', 'Unfollow user with id \':id\''
  description 'The id in the params is the id of the user to be unfollowed'

  example %q(
            Request:
            {
              "id":"12",
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

            Response:
            {
              "status":"success",
            }
  )

  def destroy
    super
  end
end

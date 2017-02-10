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
              "access-token"=>"xXIwMG3yBOzxUF5S5CLG23lj",
              "token-type"=>"Bearer",
              "client"=>"HcjE_K4u0TLWVQZ9UODHgw",
              "expiry"=>"1486741920",
              "uid"=>"email@email.com",
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
              "access-token"=>"xXIwMG3yBOzxUF5S5CLG23lj",
              "token-type"=>"Bearer",
              "client"=>"HcjE_K4u0TLWVQZ9UODHgw",
              "expiry"=>"1486741920",
              "uid"=>"email@email.com",
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

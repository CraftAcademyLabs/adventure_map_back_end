module Api::V1::Docs::LikesDoc
  extend Apipie::DSL::Concern

  api :POST, '/likes', 'Like an activity '
  description 'You need to provide \'activity_id\' for the activity to be followed (liked) in the params with the request'
  example %q(
            Request:
            {
              "activity_id":"12",
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

  api :DELETE,  '/likes/:id', 'Unlike activity with id \':id\''
  description 'The id in the params is the id of the activity to be unliked'

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

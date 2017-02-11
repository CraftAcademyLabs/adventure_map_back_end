module Api::V1::Docs::CommentsDoc
  extend Apipie::DSL::Concern
  api :POST, '/activities/:activity_id/comments'

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
            "status": "success",
            "data": {
                "body": "that was awesome again and again",
                "user": {
                    "id": 2,
                    "provider": "email",
                    "uid": "me.me@me.meme",
                    "name": "setesting",
                    "nickname": null,
                    "image": null,
                    "email": "me.me@me.meme",
                    "created_at": "2017-02-10T09:24:34.988Z",
                    "updated_at": "2017-02-10T09:33:50.727Z",
                    "date_of_birth": null,
                    "gender": null,
                    "city": null
                },
                "activity": {
                    "id": 1,
                    "title": "My activivity",
                    "body": "sfdsefev",
                    "difficulty": 1,
                    "category": "Hiking",
                    "created_at": "2017-02-08T10:41:42.004Z",
                    "updated_at": "2017-02-08T10:41:42.004Z",
                    "user_id": 1
                }
                  }
    }
  )

  def create
    super
  end

  api :DELETE, '/activities/:activity_id/:id'
  description 'Deletes comment with id :id that belongs to activity with id :activity_id'

  example %q(
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
              status: "success"
            }

  )

  def destroy
    super
  end

end

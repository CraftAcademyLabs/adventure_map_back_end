module Api::V1::Docs::UsersDoc
  extend Apipie::DSL::Concern

  def_param_group :activity do
    param :title, String, 'Activity title', required: true
    param :body, String, 'Activity body', required: true
    param :difficulty, Integer, 'Activity difficulty', required: true
    param :category, String, 'Activity category', required: true
  end

  api :GET, '/users/:id/activities', "Get user's activities"
  description <<-EOF
    Returns a collection of activities to be displayed on
    the users activitiy feed.
  EOF

  example %q(
              Request:
               {
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
                "status": "success",
                "data": [
                  {
                    "id": 4,
                    "title": "Hiking in Vättlefjäll",
                    "body": "Had a great time in Angered and so can you!",
                    "difficulty": 3,
                    "category": "Back country skiing",
                    "created_at": " 5 February, 2017",
                    "comments_count": 3,
                    "images": [
                      {
                        "id": 2,
                        "activity_id": 4,
                        "file_attachment": "http://example.com/image.jpg",
                        "created_at": "2017-02-09T20:56:04.704Z",
                        "updated_at": "2017-02-09T20:56:04.704Z",
                        "attachment_type": "Image"
                      }
                    ]
                  },

                  {
                    "id": 26,
                    "title": "Another activity",
                    "body": "  x   x ",
                    "difficulty": 1,
                    "category": "Hiking",
                    "created_at": " 9 February, 2017",
                    "comments_count": 5,
                    "images": []
                  }
                ]
              }
  )

  def index
    super
  end

end

module Api::V1::Docs::ActivitiesDoc
  extend Apipie::DSL::Concern

  def_param_group :activity do
    param :title, String, 'Activity title', required: true
    param :body, String, 'Activity body', required: true
    param :difficulty, Integer, 'Activity difficulty', required: true
    param :category, String, 'Activity category', required: true
  end

  api :GET, '/activities', 'Get activity feed'
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
                    "user": {
                      "id": 1,
                      "name": "Tompa Thopmsson",
                      "image": null,
                      "interests": [],
                      "followers_count": 2
                    },
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
                    "user": {
                      "id": 2,
                      "name": "Rand Guy",
                      "image": "http://graph.facebook.com/v2.6/102963366889840/picture",
                      "interests": []
                    },
                    "comments_count": 5,
                    "images": []
                  }
                ]
              }
  )

  def index
    super
  end

  api :POST, '/activities', 'Create an activity'
  description <<-EOF
    Creates an activity. \n
    Activities belong to a User. Headers must include access tokens.
  EOF

  param_group :activity

  example %q(
              Request:
               {
                 title: 'Wicked Hiking Trip',
                 body: 'So much fun at Delsjön'
                 difficulty: 1,
                 category: 'Hiking'
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
                "data": {
                  "id": 1,
                  "title": "Title",
                  "body": "Just a description",
                  "difficulty": 2,
                  "category": "Hiking",
                  "user": {
                    "id": 3,
                    "provider": "email",
                    "uid": "thomas@random.se",
                    "name": "Thomas",
                    "nickname": "thomas",
                    "image": null,
                    "email": "thomas@random.se",
                    "created_at": "2017-02-05T09:46:29.740Z",
                    "updated_at": "2017-02-11T08:37:55.008Z",
                    "date_of_birth": "1990-01-01",
                    "gender": "Male",
                    "city": ""
                  },
                  "images": []
                }
              }
  )


  def create
    super
  end

  api :GET, '/activities/:id', 'Gets a single activity by id'
  description <<-EOF
    Retrieves a single instance of Activity.
  EOF

  example %q(
            Response:
            {
              "status": "success",
              "data": {
                "title": "Hiking in Vättlefjäll",
                "body": "Had a great time in Angered and so can you!",
                "difficulty": 3,
                "category": "Back country skiing",
                "user": {
                  "id": 1,
                  "provider": "email",
                  "uid": "thomas2@random.se",
                  "name": "Tompa Thopmsson",
                  "nickname": "thompa",
                  "image": null,
                  "email": "thomas2@random.se",
                  "created_at": "2017-02-05T09:39:36.472Z",
                  "updated_at": "2017-02-06T05:56:16.478Z",
                  "followers_count": 2,
                },
                 "comments": [
                    {
                      "id": 1,
                      "body": "This is the first comment.",
                      "activity_id": 1,
                      "created_at": "2017-02-09T12:18:04.742Z",
                      "updated_at": "2017-02-09T13:09:47.159Z",
                      "user": {
                        "id": 4
                        "name": "Aha'kn n",
                        "nickname": "nick",
                        "image": null
                      }
                    },
                    {
                      "id": 2,
                      "body": "that was awesome again and again",
                      "activity_id": 1,
                      "created_at": "2017-02-10T09:35:31.754Z",
                      "updated_at": "2017-02-10T09:35:31.754Z",
                      "user": {
                        "id": 1
                        "name": "setesting",
                        "nickname": null,
                        "image": null
                      }
                    },
                    {
                      "id": 3,
                      "body": "Yet another comment to make them 3",
                      "activity_id": 1,
                      "created_at": "2017-02-22T11:27:22.738Z",
                      "updated_at": "2017-02-22T11:27:22.738Z",
                      "user": {
                        "id": 1
                        "name": "Aha'kn n",
                        "nickname": "nick",
                        "image": null
                      }
                    }
                ],
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
              }
          }
  )

  def show
    self
  end

end

module Api::V1::Docs::ActivitiesDoc
  extend Apipie::DSL::Concern

  def_param_group :activity do
    param :title, String, 'Activity title', required: true
    param :body, String, 'Activity body', required: true
    param :difficulty, Integer, 'Activity difficulty', required: true
    param :category, String, 'Activity category', required: true
  end

  api :GET, '/activities', 'Get activity feed'

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
                "status":"success",
                "data": [
                            {
                              "title":"Wicked Hiking Trip",
                              "body":"So much fun at Delsjön",
                              "difficulty":1,
                              "category":"Hiking"
                              "created_at":"2017-02-03T09:23:53.367Z",
                              "user":
                                        {
                                           "id": 8,
                                           "name":"Email",
                                           "image":nil,
                                           "interests": [
                                               "Hiking", "Mountain Biking"
                                            ]
                                        }
                            }
                ]
              }
  )

  def index
    super
  end

  api :POST, '/activities', 'Create an activity'
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
                "status":"success",
                "data":
                            {
                              "title":"Wicked Hiking Trip",
                              "body":"So much fun at Delsjön",
                              "difficulty":1,
                              "category":"Hiking"
                            }
              }
  )

  description 'Activities belong to a User. Headers must include access tokens.'

  def create
    super
  end

  api :GET, '/activities/:id', 'Gets a single activity by id'

  example %q(
            Response:
            {
              "status":"success",
              "data":
                          {
                            "title":"Wicked Hiking Trip",
                            "body":"So much fun at Delsjön",
                            "difficulty":1,
                            "category":"Hiking"
                          }
            }
  )

  def show
    self
  end

end

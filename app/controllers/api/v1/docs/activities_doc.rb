module Api::V1::Docs::ActivitiesDoc
  extend Apipie::DSL::Concern

  def_param_group :activity do
    param :title, String, 'Activity title', required: true
    param :body, String, 'Activity body', required: true
    param :difficulty, Integer, 'Activity difficulty', required: true
    param :category, String, 'Activity category', required: true
  end
  api :POST, '/activity', 'Create an activity'
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
                "activity":
                            {
                              "title":"Wicked Hiking Trip",
                              "body":"So much fun at Delsjön",
                              "difficulty":1,
                              "category":"Hiking",
                              "user_id":5
                            }
              }
  )

  description 'Activities belong to a User. Headers must include access tokens.'

  def create
    super
  end

end

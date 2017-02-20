module Api::V1::Docs::ActivityDetailsDoc
  extend Apipie::DSL::Concern

  def_param_group :activity do
    param :activity_id, Integer, 'Associated Activity id', required: true
    param :file_attachment, String, 'url of the file uploaded', required: true
    param :attachment_type, String, 'Type of the attached file', required: true
  end

  api :POST, '/activities/:activity_id/activity_details', 'Save new activity detail'
  description <<-EOF
    saves new activity detail and returns the activity detail
    together with the associated activity on successful save
  EOF

  example %q(
              Request:
               {
                 "file_attachment": "http://example.com/file"
                 "attachment_type": "Image"
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
                  "data":
                  {
                    "file_attachment": "http://example.com/file",
                      "attachment_type": "Image",
                      "id": 3,
                      "activity":
                      {
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
end

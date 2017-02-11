json.status 'success'
json.data do
  json.body @comment.body
  json.user @comment.user
  json.activity @comment.activity
end

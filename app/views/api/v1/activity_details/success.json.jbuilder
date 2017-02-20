json.status 'success'
json.data do
  json.(@detail,
       :file_attachment,
       :attachment_type,
       :id
       )
  json.activity @detail.activity
end

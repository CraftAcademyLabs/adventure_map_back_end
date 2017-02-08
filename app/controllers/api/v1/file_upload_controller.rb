class Api::V1::FileUploadController < ActionController::API
  def upload
    if valid_params?
      s3 = Aws::S3::Resource.new
      obj = s3.bucket('adventuremap').object(filepath)
      upload_url = obj.presigned_url(:put, acl: 'public-read', expires: 600)
      render json: { upload_url: upload_url, public_url: obj.public_url }
    else
      render json: { error: 'Invalid Params' }
    end
  end

  private

  def valid_params?
    params[:filename] && params[:type]
  end

  def filepath
    "#{params[:type]}/#{params[:filename]}"
  end
end

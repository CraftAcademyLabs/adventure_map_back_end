class Api::V1::FileUploadController < ActionController::API
  def upload
    if valid_params?
      params_obj = {
        acl: 'public-read',
        content_type: params[:content_type]
      }

      s3 = Aws::S3::Resource.new
      obj = s3.bucket('adventuremap').object(filepath)
      url = obj.presigned_url(:put, params_obj)

      render json: { upload_url: url, public_url: obj.public_url }
    else
      render json: { error: 'Invalid Params' }
    end
  end

  private

  def valid_params?
    params[:filename] && params[:type]
  end

  def filepath
    "#{params[:type]}/#{ts_filename}"
  end

  def ts_filename
    "#{Time.now.strftime('%Y%m%d%H%M%S')}_#{params[:filename]}"
  end
end

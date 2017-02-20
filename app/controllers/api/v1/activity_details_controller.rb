class Api::V1::ActivityDetailsController < ActionController::API

  def create
    @detail = ActivityDetail.new(activity_params)
    if @detail.save
      render 'show'
    else
      render 'errors'
    end

  end

  private

  def activity_params
    params.permit(:file_attachment, :attachment_type, :activity_id)
  end

end

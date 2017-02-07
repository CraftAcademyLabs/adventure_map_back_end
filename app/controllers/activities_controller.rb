class ActivitiesController < ApplicationController
  include Godmin::Resources::ResourceController

  def redirect_after_create
    activities_path
  end

  private

  def resource_params
    params.require(:activity).permit(:title,
                                     :body,
                                     :user_id,
                                     :difficulty,
                                     :category)
  end
end

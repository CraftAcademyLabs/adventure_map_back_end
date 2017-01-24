class ActivitiesController < ApplicationController
  include Godmin::Resources::ResourceController

  def redirect_after_create
    activities_path
  end
end

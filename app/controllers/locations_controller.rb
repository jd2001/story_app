class LocationsController < ApplicationController
  before_action :find_location, only: [:show, :edit, :update, :destroy]

  def index
    @story = Story.find(params[:story_id])
    @locations = Location.where(story_id: @story.id)
  end

  def new
  end

  def create
    @story = Story.find(params[:story_id])
    @location = @story.locations.create(location_params)
    @location.save

    redirect_to edit_story_location_path(id: @location.id, story_id: @story.id)
  end

  def show
  end

  def edit
  end

  def update
    @location.update_attributes(location_params)
    redirect_to story_location_path
  end

  def destroy
    @story = @location.story_id
    @location.destroy

    redirect_to story_locations_path
  end

  private

  def find_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name, :location_type, :population)
  end

end

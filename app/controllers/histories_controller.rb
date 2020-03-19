class HistoriesController < ApplicationController
  before_action :find_history, only: [:show, :edit, :update, :destroy]

  def index
    @story = Story.find(params[:story_id])
    @histories = History.where(story_id: @story.id)
  end

  def new
  end

  def create
    @story = Story.find(params[:story_id])
    @history = @story.histories.create(location_params)
    @history.save

    redirect_to story_history_path(id: @history.id, story_id: @story.id)
  end

  def show
  end

  def edit
  end

  def update
    @history.update_attributes(location_params)
    redirect_to story_histories_path
  end

  def destroy
    @story = @history.story_id
    @history.destroy

    redirect_to story_histories_path
  end

  private

  def find_history
    @history = History.find(params[:id])
  end

  def location_params
    params.require(:history).permit(:title, :body)
  end
end

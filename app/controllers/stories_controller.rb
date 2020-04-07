class StoriesController < ApplicationController
before_action :find_story, only: [:show, :edit, :update, :destroy]

  def index
    @stories = Story.where(user_id: current_user.id)
  end

  def new
    @story = current_user.stories.build
  end

  def create
    @story = current_user.stories.build(story_params)

    if @story.save
      redirect_to @story
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @story.update_attributes(story_params)
    redirect_to story_path
  end

  def destroy
    @story.destroy
    redirect_to stories_path
  end

  private
    def find_story
      @story = Story.find(params[:id])
    end

    def story_params
      params.require(:story).permit(:title)
    end
end

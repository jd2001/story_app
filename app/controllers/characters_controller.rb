class CharactersController < ApplicationController
before_action :find_character, only: [:show, :edit, :update, :destroy]

  def index
    @story = Story.find(params[:story_id])
    @characters = Character.where(story_id: @story.id)
  end

  def new
  end

  def create
    @story = Story.find(params[:story_id])
    @character = @story.characters.create(character_params)
    @character.save

    redirect_to story_character_path(story_id: @story.id, id: @character.id)
  end

  def show
  end

  def edit
  end

  def update
    @character.update_attributes(character_params)
    redirect_to story_character_path
  end

  def destroy
    @story = @character.story_id
		@character.destroy

		redirect_to story_characters_path
  end

  private
  def find_character
    @character = Character.find(params[:id])
  end

  def character_params
    params.require(:character).permit(:name, :gender, :age)
  end
end

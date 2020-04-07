class RelationshipsController < ApplicationController

  def new
    @character = Character.find(params[:character_id])
  end

  def create
    @story = Story.find(params[:story_id])
    @character = Character.find(params[:character_id])
    @relationship = Relationship.create(first_character_id: @character.id, second_character_id: params[:relationship][:second_character_id])
    @relationship.save

    redirect_to story_character_path(story_id: @story.id, id: @character.id)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def relationship_params
      params.require(:relationship).permit(:description, :second_character)
    end
end

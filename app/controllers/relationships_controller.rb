class RelationshipsController < ApplicationController
  before_action :find_character, only: [:new, :show, :edit, :update, :destroy]
  before_action :find_relationship, only: [:edit, :update, :destroy]

  def new
    @characters = Character.where(story_id: @character.story_id).where.not(id: @character.id)
  end

  def create
    @story = Story.find(params[:story_id])
    @character = Character.find(params[:character_id])
    @relationship = Relationship.create(first_character_id: @character.id, second_character_id: params[:relationship][:second_character_id], description: params[:relationship][:description])
    if @relationship.save
      redirect_to story_character_path(story_id: @story.id, id: @character.id)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @relationship.update_attributes(relationship_params)
    redirect_to story_character_path(story_id: @character.story_id, id: @character.id)
  end

  def destroy
    @relationship = Relationship.find(params[:id])
    @relationship.destroy
    redirect_to story_character_path(story_id: @character.story_id, id: @character.id)
  end

  private
    def find_character
      @character = Character.find(params[:character_id])
    end

    def find_relationship
      @relationship = Relationship.find(params[:id])
    end

    def relationship_params
      params.require(:relationship).permit(:description, :first_character, :second_character)
    end
end

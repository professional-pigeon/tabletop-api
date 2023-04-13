module Api
  class CharactersController < ApplicationController
    before_action :authorize_request

    def index
      find_char_place(params[:char_place_type], params[:char_place_id])
      characters = @place.characters
      serialized_res = CharacterBlueprint.render(characters)
      render json: serialized_res
    end

    def show
      ## set up permissions scheme
      character = Character.find(params[:id])
      serialized_res = CharacterBlueprint.render(character)
      render json: serialized_res
    end

    def create
      create_params(params)
      character = Character.create(@create_params)
      serialized_res = CharacterBlueprint.render(character)
      render json: serialized_res
    end

    def update
      update_params(params)
      character = Character.find(params[:id])
      character.update(@update_params)
      serialized_res = CharacterBlueprint.render(character)
      render json: serialized_res
    end

    def destroy
      character = Character.find(params[:id])
      character.destroy
      head :ok
    end

    private

    def create_params(params)
      @create_params ||= params.permit(:name, :character_type, :character_race, :description, :char_place_id, :char_place_type)
    end

    def update_params(params)
      @update_params ||= params.permit(:name, :character_type, :character_race, :description, :char_place_id, :char_place_type)
    end

    def find_char_place(type, id)
      if type == "Location"
        @place = Location.find(id)
      else
        @place = Campaign.find(id)
      end
    end
  end
end
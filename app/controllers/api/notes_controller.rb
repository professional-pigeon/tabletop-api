module Api
  class NotesController < ApplicationController
    before_action :authorize_request

    def create
      create_params(params)
      note = Note.create(@create_params)
      serialized_res = NoteBlueprint.render(note)
      render json: serialized_res
    end

    def update
      update_params(params)
      note = Note.find(params[:id])
      note.update(@update_params)
      serialized_res = NoteBlueprint.render(note)
      render json: serialized_res
    end

    def destroy
      note = Note.find(params[:id])
      note.destroy
      head :ok
    end

    private

    def create_params(params)
      @create_params ||= params.permit(:content, :note_place_id, :note_place_type)
    end

    def update_params(params)
      @update_params ||= params.permit(:content)
    end

  end
end


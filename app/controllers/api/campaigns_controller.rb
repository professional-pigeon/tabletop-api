module Api
  class CampaignsController < ApplicationController
    before_action :authorize_request

    def index
      user = User.find(session[:user_id])
      campaigns = user.campaigns
      serialized_res = CampaignBlueprint.render(campaigns)
      render json: serialized_res
    end

    def show
      ## set up permissions scheme
      campaign = Campaign.find(params[:id])
      serialized_res = CampaignBlueprint.render(campaign, view: :full)
      render json: serialized_res
    end

    def create
      user_id = User.find(session[:user_id]).id
      campaign = Campaign.new(name: params[:name], user_id: user_id)
      if campaign.save
        serialized_res = CampaignBlueprint.render(campaign, view: :full)
        render json: serialized_res
      else
        render json: { error: 'Campaign could not be crated' }, status: :unauthorized
      end
    end

    def update
      update_params(params)
      campaign = Campaign.find(params[:id])
      campaign.update(@update_params)
      serialized_res = CampaignBlueprint.render(campaign, view: :full)
      render json: serialized_res
    end

    def destroy
      campaign = Campaign.find(params[:id])
      campaign.destroy
      head :ok
    end

    private

    def update_params(params)
      @update_params ||= params.permit(:name)
    end
  end
end
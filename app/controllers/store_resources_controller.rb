class StoreResourcesController < ApplicationController

  # GET /state
  def state
    resource = StoreResource.includes(:state_changes).find_by(
      resource_type: params[:resource_type],
      resource_id: params[:resource_id]
    )
    render json: resource.state_at(params[:time]), status: 200
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Resource Not Found' }, status: 404
  end

  # GET /resource_ids
  def resource_ids
    resource_ids = StoreResource.where(resource_type: params[:resource_type]).pluck(:resource_id)
    render json: resource_ids, status: :ok
  end
end

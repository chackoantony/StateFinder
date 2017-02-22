class StateChangesController < ApplicationController
  
  def import_data
    StateChange.import(params[:file])
    render json: {msg: 'success'}, status: 200
  rescue => e
    render json: {error: e.message}, status: 422 
  end

end

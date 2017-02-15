class StoreResourcesController < ApplicationController
  before_action :set_store_resource, only: [:show, :edit, :update, :destroy]

  # GET /store_resources
  # GET /store_resources.json
  def index
    @store_resources = StoreResource.all
  end

  # GET /store_resources/1
  # GET /store_resources/1.json
  def show
  end

  # GET /store_resources/new
  def new
    @store_resource = StoreResource.new
  end

  # GET /store_resources/1/edit
  def edit
  end

  # POST /store_resources
  # POST /store_resources.json
  def create
    @store_resource = StoreResource.new(store_resource_params)

    respond_to do |format|
      if @store_resource.save
        format.html { redirect_to @store_resource, notice: 'Store resource was successfully created.' }
        format.json { render :show, status: :created, location: @store_resource }
      else
        format.html { render :new }
        format.json { render json: @store_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /store_resources/1
  # PATCH/PUT /store_resources/1.json
  def update
    respond_to do |format|
      if @store_resource.update(store_resource_params)
        format.html { redirect_to @store_resource, notice: 'Store resource was successfully updated.' }
        format.json { render :show, status: :ok, location: @store_resource }
      else
        format.html { render :edit }
        format.json { render json: @store_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /store_resources/1
  # DELETE /store_resources/1.json
  def destroy
    @store_resource.destroy
    respond_to do |format|
      format.html { redirect_to store_resources_url, notice: 'Store resource was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store_resource
      @store_resource = StoreResource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_resource_params
      params.require(:store_resource).permit(:resource_type, :changed_at, :changed_values)
    end
end

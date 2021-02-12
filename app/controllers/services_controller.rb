class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update]
  before_action :set_vehicle, only: [:create, :update]

  # GET /services
  # GET /services.json
  def index
    @services = Service.all
  end

  # GET /services/1
  # GET /services/1.json
  def show
  end

  # GET /services/new
  def new
    @service = Service.new
    @vehicle = Vehicle.find(params[:id])
  end

  # GET /services/1/edit
  def edit
  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(service_params)

    respond_to do |format|
      if @service.save
        format.html { redirect_to services_vehicle_url(id: @vehicle.id), notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to services_vehicle_path(id: @vehicle.id), notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service = Service.find(params[:id])
    @vehicle = Vehicle.find_by(id: @service.vehicle_id)

    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_vehicle_path(id: @vehicle.id), notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delete_receipt
    receipt = ActiveStorage::Attachment.find(params[:receipt_id])
    receipt.purge
    redirect_back(fallback_location: request.referer)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
      @vehicle = Vehicle.find_by(id: @service.vehicle_id)
    end

    def set_vehicle
      @vehicle = Vehicle.find(params[:service][:vehicle_id])
      @services = Service.where(vehicle_id: params[:service][:vehicle_id])
    end

    # Only allow a list of trusted parameters through.
    def service_params
      params.require(:service).permit(
        :name,
        :date_of_service,
        :miles,
        :warranty_length,
        :location,
        :notes,
        :cost,
        :vehicle_id,
        :receipt_image
      )
    end
end

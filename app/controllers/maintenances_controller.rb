class MaintenancesController < ApplicationController
  # restrict access to pages
  before_filter :authenticate_user!, :redirect_driver
  
  include ApplicationHelper
  
  # GET /maintenances
  # GET /maintenances.json
  def index
    # Show all records
    params[:search] = format_date params[:search]
    
    @maintenances = Maintenance.search(params[:search], params[:column]).order(sort_column(Maintenance, 'vehicle_id') + ' ' + sort_direction).page(params[:page]).per(10)
    
    get_params()

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @maintenances }
    end
  end

  # GET /maintenances/1
  # GET /maintenances/1.json
  def show
    # Show one record
    @maintenance = Maintenance.find(params[:id])
    # Since vehicle id can correspond to truck or trailer, we need to check which one is correct
    # which is set with vehicle type. Use the appropriate query based on the result
    if @maintenance.vehicle_type == 'truck'
     @truck = Truck.find(@maintenance.vehicle_id) rescue nil
    else
     @trailer = Trailer.find(@maintenance.vehicle_id) rescue nil
    end
    @trip = Trip.find(@maintenance.trip_id) rescue nil
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @maintenance }
    end
  end

  # GET /maintenances/new
  # GET /maintenances/new.json
  def new
    # Form to create a new record
    @maintenance = Maintenance.new
    @trips = Trip.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @maintenance }
    end
  end

  # GET /maintenances/1/edit
  def edit
    # Form to edit a record
    @maintenance = Maintenance.find(params[:id])
    @trips = Trip.all
  end

  # POST /maintenances
  # POST /maintenances.json
  def create
    # Logic to createa record
    @maintenance = Maintenance.new(params[:maintenance])

    respond_to do |format|
      if @maintenance.save
        format.html { redirect_to @maintenance, notice: 'Maintenance was successfully created.' }
        format.json { render json: @maintenance, status: :created, location: @maintenance }
      else
        format.html { render action: "new" }
        format.json { render json: @maintenance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /maintenances/1
  # PUT /maintenances/1.json
  def update
    # Logic to update a record
    @maintenance = Maintenance.find(params[:id])

    respond_to do |format|
      if @maintenance.update_attributes(params[:maintenance])
        format.html { redirect_to @maintenance, notice: 'Maintenance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @maintenance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintenances/1
  # DELETE /maintenances/1.json
  def destroy
    # Logic to delete a record
    @maintenance = Maintenance.find(params[:id])
    @maintenance.destroy

    respond_to do |format|
      format.html { redirect_to maintenances_url }
      format.json { head :no_content }
    end
  end
end

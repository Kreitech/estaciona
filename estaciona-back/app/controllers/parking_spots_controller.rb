class ParkingSpotsController < ApplicationController
#  before_action :set_parking_spot, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token

  # GET /parking_spots
  # GET /parking_spots.json
  def index
    @parking_spots = ParkingSpot.all



    respond_to do |format|
      format.html { render :index }
      format.json { render :json => @parking_spots.to_json  }
    end
  end

  def getCoords
   #coordxi
   #coordyi
   #coordxii
   #coordyii
   parkings = ParkingSpot.where('coordX < ? and coordX > ? and coordY < ?  and coordY > ?  ',params[:coordxii],params[:coordxi],params[:coordyi],params[:coordyii])
	#parkings.each do |a|
	#  final << { :coordX => a['coordX'], :coordY => a['coordY'], :time => a['time_out'] }
	#end
   respond_to do |format|
      format.html { head :no_content }
      format.json { render :json => parkings.to_json }
    end
    

  end


  def parking
      @parking_spot = ParkingSpot.new
      @parking_spot.coordX = params[:coordX]
      @parking_spot.coordY = params[:coordY]
      @parking_spot.state = 1
      @parking_spot.save()
 respond_to do |format|
      format.html { head :no_content }
      format.json { render :json => '1' }
    end
  end

  def leavePlace
      @parking_spot = ParkingSpot.new
      @parking_spot.coordX = params[:coordX]
      @parking_spot.coordY = params[:coordY]
      @parking_spot.time_out = params[:time]
      @parking_spot.state = 2
      @parking_spot.save()
       	    respond_to do |format|
	      format.html { head :no_content }
	      format.json { render :json => '1' }
	    end
      
  end

  # GET /parking_spots/1
  # GET /parking_spots/1.json
  def show
  end

  # GET /parking_spots/new
  def new
    @parking_spot = ParkingSpot.new
  end

  # GET /parking_spots/1/edit
  def edit
  end

  
  # POST /parking_spots
  # POST /parking_spots.json
  def create
    @parking_spot = ParkingSpot.new(parking_spot_params)

    respond_to do |format|
      if @parking_spot.save
        format.html { redirect_to @parking_spot, notice: 'Parking spot was successfully created.' }
        format.json { render :show, status: :created, location: @parking_spot }
      else
        format.html { render :new }
        format.json { render json: @parking_spot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parking_spots/1
  # PATCH/PUT /parking_spots/1.json
  def update
    respond_to do |format|
      if @parking_spot.update(parking_spot_params)
        format.html { redirect_to @parking_spot, notice: 'Parking spot was successfully updated.' }
        format.json { render :show, status: :ok, location: @parking_spot }
      else
        format.html { render :edit }
        format.json { render json: @parking_spot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parking_spots/1
  # DELETE /parking_spots/1.json
  def destroy
    @parking_spot.destroy
    respond_to do |format|
      format.html { redirect_to parking_spots_url, notice: 'Parking spot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parking_spot
      @parking_spot = ParkingSpot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parking_spot_params
      params.require(:parking_spot).permit(:coordX, :coordY, :state, :time_out)
    end
end

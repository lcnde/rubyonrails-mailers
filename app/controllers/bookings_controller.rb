class BookingsController < ApplicationController
  
  def new
    @booking = Booking.new
    (params[:seats].to_i).times {@booking.passengers.build} #booking.passengers.build builds the passengers instantiated with the booking_id that you are creating now(but it was not yet created). This way the passenger that you create will inherit the booking_id from the booking that you are creating with the form 
    @flight = Flight.find_by(id: params[:flight_id])
    @seats = params[:seats].to_i
  end

  def create
    @booking = Booking.new(booking_params)
    @flight = Flight.find_by(id: params[:flight_id])
    @seats = params[:seats].to_i
    if @booking.save
      redirect_to flights_path
    else
      flash.now[:alert] = "Something went wrong"
      render :new
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:flight_id, :email, :billing, passengers_attributes: [:name, :surname, :booking_id])
  end

end

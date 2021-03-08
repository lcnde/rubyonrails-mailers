class BookingsController < ApplicationController
  
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirecto_to flights_path
    else
      flash.now[:alert] = "Something went wrong"
      render :new
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:flight_id, :email, :billing, passenger: [:name, :surname, :booking_id])
  end

end

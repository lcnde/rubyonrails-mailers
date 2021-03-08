class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map { |airport| [airport.code, airport.id] } #this line of code maps the airports so you can use it in the dropdown menu in the #index
    
      if params.has_key?(:departure_airport_id) && params.has_key?(:destination_airport_id) #this is necessary so if the params does not have any key (so the user has not given anything to search for), then the available flights will not be rendering in the index 
        if params[:departure_airport_id] == "" && params[:destination_airport_id] == ""
          flash.now[:alert] = "Please insert departure and destination airport"
        elsif params[:departure_airport_id] == ""
          flash.now[:alert] = "Please insert departure airport"
        elsif params[:destination_airport_id] == ""
          flash.now[:alert] = "Please insert destination airport"
        else
          if params[:date] != "" #date gets deleted from params if it is empty, so if the user doesnt input the date he can see all the flights to the selected airportts that will take place in the future
            @available_flights = Flight.where(flight_params)
          else
            params.delete(:date)
            @available_flights = Flight.where(flight_params)
          end
        end  
      #@available_flights = Flight.where(departure_airport_: params[:departure_airport_], destination_airport_id: params[:destination_airport_id], datetime: params[:datetime])
      #@flight_search = Flight.search(params[:flight])
      #@flight_options = Flight.all.map { |a| [ a.departing_airport.code, a.departing_airport.id ] }.uniq
    end
  end

  private
  def flight_params
    params.permit(:departure_airport_id, :destination_airport_id, :date, :seats)
  end

end

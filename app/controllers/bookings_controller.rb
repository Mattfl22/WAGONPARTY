class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    authorize @booking
    @wagon = Wagon.find(params[:wagon_id])
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @wagon = Wagon.find(params[:wagon_id])
    @booking.wagon = @wagon
    @booking.user = current_user
    if @booking.save
      redirect_to user_path(current_user)
    else
      redirect_to wagon_path(@wagon)
    end

  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :start_location)
  end
end

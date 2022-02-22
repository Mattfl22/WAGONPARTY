class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    authorize @booking
    @wagon = Wagon.find(params[:wagon_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @wagon = Wagon.find(params[:wagon_id])
    @booking.wagon = @wagon
    @booking.save
    redirect_to user_path(current_user)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :start_location, :end_location, :user_id, :wagon_id)
  end
end

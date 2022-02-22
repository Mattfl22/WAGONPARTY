class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @wagon = Wagon.find(params[:wagon_id])
    @user = User.find(params[:user_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @wagon = Wagon.find(params[:wagon_id])
    @user = User.find(params[:user_id])
    @booking.wagon = @wagon
    @booking.user = @user
    @booking.save
    redirect_to wagons_path(@user)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :start_location, :end_location, :user_id, :wagon_id)
  end
end

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

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to user_path(@booking.user)
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
    @user = current_user
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    authorize @booking
    if @booking.save
      redirect_to user_path(@booking.user)
    else
      redirect_to user_path(current_user)
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :start_location, :id, :rating, :comment)
  end
end

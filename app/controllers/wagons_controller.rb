
class WagonsController < ApplicationController
  before_action :find_wagon, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @wagons = policy_scope(Wagon).order(created_at: :desc)
    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    # @wagons = Wagon.all

    if params[:query].present?
      @wagons = Wagon.where("location ILIKE ?", "%#{params[:query]}%")
    else
      @wagons = Wagon.all
    end

    @markers = @wagons.geocoded.map do |wagon|
      {
        lat: wagon.latitude,
        lng: wagon.longitude
      }
    end
  end

  def show
    authorize @wagon
  end

  def new
    @wagon = Wagon.new
    authorize @wagon
    @user = User.find(params[:user_id])
  end

  def create
    @wagon = Wagon.new(wagon_params)
    authorize @wagon
    @user = User.find(params[:user_id])
    @wagon.user = @user
    @wagon.save
    redirect_to wagons_path(@user)
  end

  def edit
    authorize @wagon
  end

  def update
    authorize @wagon
    @wagon.update(wagon_params)
    @user = current_user
    @wagon.user = @user
    @wagon.save
    redirect_to user_path(@user)
  end

  private

  def find_wagon
    @wagon = Wagon.find(params[:id])
  end

  def wagon_params
    params.require(:wagon).permit(:name, :description, :user_id, :capacity, :location, :dates, :photo)
  end
end

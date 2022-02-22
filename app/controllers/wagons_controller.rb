class WagonsController < ApplicationController
  before_action :find_wagon, only: [:show]
  # skip_before_action :authenticate_user!, only: [:create, :new]

  def index
    @wagons = Wagon.all
  end

  def show
  end

  def new
    @wagon = Wagon.new
    @user = User.find(params[:user_id])
  end

  def create
    @wagon = Wagon.new(wagon_params)
    @user = User.find(params[:user_id])
    @wagon.user = @user
    @wagon.save
    redirect_to wagons_path(@user)
  end

  private

  def find_wagon
    @wagon = Wagon.find(params[:id])
  end

  def wagon_params
    params.require(:wagon).permit(:name, :description, :user_id, :capacity)
  end
end

class WagonsController < ApplicationController
  before_action :find_wagon, only: [:show, :create]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @wagons = Wagon.all
  end

  def show
  end

  def new
    @wagon = Wagon.new
  end

  def create
    @wagon = Wagon.new(wagon_params)
    @user = User.find(params[:user_id])
    @wagon.user = @user
    @wagon.save
    redirect_to user_wagons_path(@user)
  end

  private

  def before_action
    @wagon = Wagon.find(params[:id])
  end

  def wagon_params
    params.require(:wagon).permit(:name, :description, :user_id, :capacity)
  end
end

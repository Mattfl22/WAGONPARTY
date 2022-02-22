class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
    @wagons = Wagon.where(user: @user)
  end
end

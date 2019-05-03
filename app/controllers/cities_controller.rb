class CitiesController < ApplicationController
  def index
    @cities = City.all
  end

  def show
    @city = City.find(params[:id])
    @users = User.all
    @users_by_city_id = @users.where(city_id: params[:id]).ids
    @gossips = Gossip.all
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

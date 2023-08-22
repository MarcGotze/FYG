class VenuesController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    @venue.save
    if @venue.save
      redirect_to user_venues_path(@venue)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @venue = Venue.find(params[:id])
  end

  def update
    @venue = Venue.find(params[:id])
    if @venue.update(venue_params)
      redirect_to user_venue_path(@venue)
    else
      render :new, status: :unprocessable_entity
  end

  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy
    redirect_to user_venues_path
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :address, :overview)
  end
end
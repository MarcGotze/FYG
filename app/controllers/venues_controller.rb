class VenuesController < ApplicationController
  before_action :authenticate_user!, except: :index
  # WIP

  def index
    @venues = Venue.all
    @markers = @venues.geocoded.map do |venue|
      {
        lat: venue.latitude,
        lng: venue.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { venue: venue })
      }
    end
  end

  def show
    @venue = Venue.find(params[:id])
    # @user = current_user
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    @venue.user_id = current_user.id
    @venue.save
    if @venue.save
      redirect_to venue_path(@venue)
    else
      render :new, status: :unprocessable_entity, notice: "booking successfully created"
    end
  end

  def edit
    @venue = Venue.find(params[:id])
  end

  def update
    @venue = Venue.find(params[:id])
    if @venue.update(venue_params)
      redirect_to venue_path(@venue)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @venue = Venue.find(params[:id])
    @venue.user_id = current_user.id
    if @venue.destroy
      redirect_to root_path, status: :see_other, notice: "venue deleted"
    else
      puts 'destruction failed'
    end
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :address, :overview, :user_id, :photo, :current_user)
  end
end

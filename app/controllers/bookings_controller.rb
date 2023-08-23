class BookingsController < ApplicationController
  before_action :set_booking, only: %i[destroy]

  def new
    @venue = Venue.find(params[:venue_id])
    @booking = Booking.new
  end

  def create
    @venue = Venue.find(params[:venue_id])
    @booking = Booking.new(booking_params)
    @booking.venue = @venue
    @booking.user_id = current_user.id
    # @booking.user_id = current_user
    # TODO: @booking is undefined, render nill
    if @booking.save
      redirect_to venue_path(@venue), notice: "booking successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def history
    @bookings = Booking.where(@user.role = role)
    # A REVOIR
  end

  def destroy
    @booking.destroy
    if @booking.destroy
      redirect_to user_venues_path, status: :see_other
    else
      puts 'destruction failed'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :venue_id, :user_id, :id)
  end

  def set_booking
    @booking = Booking.find(params[:venue_id])
  end
end

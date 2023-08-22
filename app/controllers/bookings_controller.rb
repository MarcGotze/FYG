class BookingsController < ApplicationController
  before_action :set_booking, only: %i[new destroy]

  def new
    @venue = Venue.find(params[:venue_id])
    @booking = Booking.new
  end

  def create
    @venue = Venue.find(params[:venue_id])
    @booking = Booking.new(booking_params)
    @booking.venue = @venue
    if @booking.save
      redirect_to history_user_venue_bookings_path(@booking), notice: "booking successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def history
    @bookings = booking.where(@user.role = role)
  end

  def destroy
    @booking.destroy
    if @booking.destroy
      redirect_to venues_path, status: :see_other
    else
      puts 'destruction failed'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :venue_id, :user_id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end

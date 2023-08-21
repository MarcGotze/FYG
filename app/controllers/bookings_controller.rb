class BookingsController < ApplicationController
  # before-action :set_booking, only: %i[destroy]

  def new
    @venue = Venue.find(params[:venue_id])
    @booking = Booking.new
  end

  def create
    if @booking.save
      redirect_to 'history_user_venue_bookings_path'
    else
    end
  end

  def history
  end

  def destroy
  end

end

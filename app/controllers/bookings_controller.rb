class BookingsController < ApplicationController

  def index
    @bookings = current_user.bookings
  end


  def new
    @booking = Booking.new
  end

  def create

    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to bookings_path(@bookings)
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def is_booking_accepted?
    if @booking.accepted == true
      redirect_to booking_path(@booking)
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.delete
    redirect_to root_path
  end

  private
  def booking_params
    params.require(:booking).permit(:user_id, :activity_id, :accepted)
  end

end

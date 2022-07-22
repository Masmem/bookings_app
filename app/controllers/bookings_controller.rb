class BookingsController < ApplicationController
    before_action :get_week_days, only: [:index]

    def index
        @bookings = Booking.where(reservation_date: @days.first.midnight..@days.last.end_of_day)
        
        respond_to do |format|
            format.html
            format.turbo_stream
        end
    end

    def edit
        @booking = current_user.bookings.find(params[:id])
    end

    def show
        @booking = Booking.find(params[:id])
    end
   
    def new
        @booking = current_user.bookings.new(reservation_date: params[:reservation_date])
    end


    def create
        @booking = current_user.bookings.new(booking_params)

        respond_to do |format|
            if @booking.save!
                @reservation_date = booking_params[:reservation_date].to_datetime
                @past_hour = @reservation_date < Time.now
                format.turbo_stream
            end
        end
    end


    def update
       @booking = current_user.bookings.find(params[:id])
       
       respond_to do |format|
            if @booking.update!(booking_params)
                @reservation_date = booking_params[:reservation_date].to_datetime
                @past_hour = @reservation_date < Time.now
                format.turbo_stream
            end
        end       
    end

    def destroy
        @booking = current_user.bookings.find(params[:id])
        @reservation_date = @booking.reservation_date   
        respond_to do |format|
            if @booking.delete
                @booking = nil
                @past_hour = @reservation_date < Time.now
                format.turbo_stream
            end
        end    
    end

    private

    def get_week_days
        @today = Time.now
        @week_reference = params.fetch(:week_reference, 0).to_i
        weekend_aux = @today.wday == 0 ? 1 : @today.wday == 6 ? 2 : 0 #variável auxiliar para ajustar a data quando sistema acessado em finais de semana
        @days = (1..5).to_a
        p " TESTEE #{(7 * @week_reference)}"
        @days = @days.map {|day| today = (@today + weekend_aux.days ); p (today.wday - day).days - (7 * @week_reference); today  - ((today.wday - day).days - (7 * @week_reference).days) }
    end

    def booking_params
        params.require(:booking).permit(:material, :description, :reservation_date)        
    end
    
    

end

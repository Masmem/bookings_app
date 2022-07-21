class BookingsController < ApplicationController
    before_action :get_week_days, only: [:index]

    def index
        @bookings = Booking.all
        respond_to do |format|
            format.html
            format.js{
                puts "Estou no js"
                render js: "bookings/index.js.erb"
            }
        end
        
    end


    private

    def get_week_days
        @today = Time.now
        weekend_aux = @today.wday == 0 ? 1 : @today.wday == 6 ? 2 : 0 #variável auxiliar para ajustar a data quando sistema acessado em finais de semana
        @days = (1..5).to_a
        @days = @days.map {|day| today = (@today + weekend_aux.days ); today  - (today.wday - day).days }
    end
    

end

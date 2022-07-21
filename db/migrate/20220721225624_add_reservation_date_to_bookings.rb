class AddReservationDateToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :reservation_date, :datetime
  end
end

class AddIndexToBookings < ActiveRecord::Migration[7.0]
  def change
    add_index :bookings, :reservation_date, unique: true
  end
end

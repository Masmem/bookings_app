class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.string :description
      t.string :material

      t.timestamps
    end
  end
end

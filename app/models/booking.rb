class Booking < ApplicationRecord

    validates :reservation_date, :uniqueness => true
end

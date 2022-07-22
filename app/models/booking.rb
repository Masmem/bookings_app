class Booking < ApplicationRecord

    validates :reservation_date, :uniqueness => true
    belongs_to :user
end

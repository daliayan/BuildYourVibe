class Room < ApplicationRecord
    belongs_to :house
    belongs_to :user, through: :houses  

    validates :name, :room_description, :windows, :hex, presence: true
    
end
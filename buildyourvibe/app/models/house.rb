class House < ApplicationRecord
    belongs_to :user
    has_many :rooms
    has_many :comments

    validates :hex, :price, :size, presence: true
    validates :name, presence: true, uniqueness: true
    valdiates :price, presence: true, numericality: {greater_than: 0, less_than: 100,000,000}

end
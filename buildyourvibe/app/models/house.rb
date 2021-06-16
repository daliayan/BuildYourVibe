class House < ApplicationRecord
    belongs_to :user
    has_many :rooms
    has_many :comments

    validates :name, :hex, :price, :size, presence: true

end
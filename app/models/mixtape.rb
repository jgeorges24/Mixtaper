class Mixtape < ApplicationRecord

    belongs_to :user
    
    validates :title, :artist, presence: true

    def uploaded_at
        self.created_at.to_date
    end

    scope :most_recent, -> {order created_at: :desc}

    scope :search, -> (query) {where("title LIKE ?", "%#{query}%") }



end

class Mixtape < ApplicationRecord
    validates :title, :artist, presence: true

    belongs_to :user
    has_many :opinions
    
    

    def uploaded_at
        self.created_at.to_date
    end

    scope :most_recent, -> {order created_at: :desc}

    scope :search, -> (query) {where("title LIKE ?", "%#{query}%") }



end

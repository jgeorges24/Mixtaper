class Mixtape < ApplicationRecord
    validates :title, :artist, presence: true

    belongs_to :user
    has_many :opinions
    
    

    def uploaded_at
        self.created_at.to_date
    end

    scope :most_recent, -> {order created_at: :desc}

    
    # def self.most_recent
    #     self.order(created_at: :desc)
    # end
    
    #scope :popular_tape, -> {order opinions.max_by :desc}
    
    
    
    scope :search, -> (query) {where("title LIKE ?", "%#{query}%") }

    def popular_tape
        self.opinions.max_by
    end


end

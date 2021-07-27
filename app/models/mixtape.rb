class Mixtape < ApplicationRecord
    validates :title, :artist, presence: true


    belongs_to :user

    # this gives me @mixtape.opinions
    has_many :opinions 
    
    # gives me @mixtape.users for all the users who gave an opinion

    has_many :users, through: :opinions

    def uploaded_at
        self.created_at.to_date
    end

    scope :most_recent, -> {order created_at: :desc}

    scope :search, -> (query) {where("title LIKE ?", "%#{query}%") }

    scope :ran_tape, -> {order('RANDOM()').first.title}

    # def ran_tape

    #     self.order('RANDOM()').first

    # end
    
    # def self.most_recent
    #     self.order(created_at: :desc)
    # end
    
    #scope :popular_tape, -> {order opinions.max_by :desc}
    

    # def popular_tape
    #     self.opinions.max_by
    # end


end

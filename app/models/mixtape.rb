class Mixtape < ApplicationRecord

    belongs_to :user
    validates :title, :artist, presence: true

    def uploaded_at
        self.created_at.to_date
    end



end

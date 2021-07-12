class Mixtape < ApplicationRecord

    belongs_to :user
    

    def uploaded_at
        self.created_at.to_date
    end



end

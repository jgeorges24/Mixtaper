class Mixtape < ApplicationRecord



    def uploaded_at
        self.created_at.to_date
    end



end

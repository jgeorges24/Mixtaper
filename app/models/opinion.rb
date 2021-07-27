class Opinion < ApplicationRecord
    validates :context, presence: true

    #able to use x.opinions 
    belongs_to :user

    #able to use x.
    belongs_to :mixtape


end

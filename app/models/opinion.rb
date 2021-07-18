class Opinion < ApplicationRecord
    validates :context, presence: true

    belongs_to :user
    belongs_to :mixtape


end

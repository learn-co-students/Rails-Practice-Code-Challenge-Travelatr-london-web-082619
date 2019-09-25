class Post < ApplicationRecord
    belongs_to :blogger
    belongs_to :destination

    validates :title, :destination_id, :blogger_id, presence: true
    validates :content, length: {minimum: 100}

    def like
        self.likes += 1
    end
end

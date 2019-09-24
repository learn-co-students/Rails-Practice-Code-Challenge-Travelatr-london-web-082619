class Post < ApplicationRecord
    belongs_to :blogger
    belongs_to :destination

    validates :title, :content, :blogger_id, :destination_id, presence: true
    validates :content, length: { minimum: 100 }

    def like
        self.likes += 1
    end
end

class Post < ApplicationRecord
    CATEGORY = ['Fiction', 'Non-Fiction']

    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {
        in:(CATEGORY),
    }
    validate :title_should_not_contain

    def title_should_not_contain
        if title == "True Facts"
            errors.add(:title, "title is not permitted")
        end
    end

end

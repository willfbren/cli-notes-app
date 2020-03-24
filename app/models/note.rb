class Note < ActiveRecord::Base
    belongs_to :category
    belongs_to :user

    def user
        self.category.user
    end
end
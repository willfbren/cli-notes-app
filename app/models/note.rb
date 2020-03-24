class Note < ActiveRecord::Base
    belongs_to :category

    def user
        return self.category.user
    end
end
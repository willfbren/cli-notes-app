class Note < ActiveRecord::Base
    belongs_to :category
    
    def user
        self.category.user
    end
end
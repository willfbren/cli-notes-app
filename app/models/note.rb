class Note < ActiveRecord::Base
    belongs_to :users through: :categories
end
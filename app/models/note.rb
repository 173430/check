class Note < ApplicationRecord
    belongs_to :subject
    belongs_to :grade
    belongs_to :user

end
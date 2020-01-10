class Note < ApplicationRecord
    belongs_to :subject
    belongs_to :grade
    belongs_to :user

    has_many :notepictures

end
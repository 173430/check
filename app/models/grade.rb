class Grade < ApplicationRecord

    has_many :questions
    has_many :notes

end

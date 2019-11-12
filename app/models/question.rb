class Question < ApplicationRecord

    belongs_to :subject

    scope :search, -> (search_params) do
        return if search_params.blank?

        search_like(search_params[:search])
    end
    scope :search_like, -> (search){ where('search LIKE ?',"%#{search}%") if search.present? }

end

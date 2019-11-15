class Question < ApplicationRecord

    belongs_to :subject

    scope :search, -> (search_params) do
        return if search_params.blank?

        search_like(search_params[:search])
          .solve_is(search_params[:solve]=="true", search_params[:solve])
    end
    scope :search_like, -> (search){ where('question LIKE ?',"%#{search}%") if search.present? }
    scope :solve_is, -> (solve, para){ where(solve: solve) if para != "both"}
end

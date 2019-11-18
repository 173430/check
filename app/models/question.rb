class Question < ApplicationRecord

    belongs_to :subject
    belongs_to :grade

    scope :search, -> (search_params) do
        return if search_params.blank?

        search_like(search_params[:search])
          .solve_is(search_params[:solve]=="true", search_params[:solve])
          .subject_id_is(search_params[:subject_id])
    end
    scope :search_like, -> (search){ where('question LIKE ?',"%#{search}%") if search.present? }
    scope :solve_is, -> (solve, para){ where(solve: solve) if para != "both"}
    scope :subject_id_is, -> (subject_id) { where(subject_id: subject_id) if subject_id.present? }
end

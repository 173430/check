class Note < ApplicationRecord
    belongs_to :subject
    belongs_to :grade
    belongs_to :user

    has_many :notepictures
    has_many :notegoods

    scope :search, -> (search_params) do
        return if search_params.blank?

        search_like(search_params[:search])
          .subject_id_is(search_params[:subject_id])
          .grade_id_is(search_params[:grade_id])
    end
    scope :search_like, -> (search){ where('note LIKE ?',"%#{search}%") if search.present? }
    scope :subject_id_is, -> (subject_id) { where(subject_id: subject_id) if subject_id.present? }
    scope :grade_id_is, -> (grade_id) { where(grade_id: grade_id) if grade_id.present? }

    def error_check
        if title.blank?
            errors[:base] << 'タイトルは必ず入力してください'
        end

        if picture.blank?
            errors[:base] << '表紙は必ず入力してください'
        end

        if coverpicture.blank?
            errors[:base] << 'ノートは必ず入力してください'
        end

    end
    
end
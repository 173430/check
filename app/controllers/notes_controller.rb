class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  # GET /notes
  # GET /notes.json
  def index
    @notes = Note.all
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    #@note.title = params[:note][:title]
    #@note.picture = params[:note][:picture]
    #@note.coverpicture = params[:note][:coverpicture]
    @note.grade_id = params[:note][:grade_id]
    @note.subject_id = params[:note][:subject_id]
    #@note.extra = params[:note][:extra]
    #@note.good = params[:note][:good]
    #@note.release = params[:note][:release]

    @note.save

    if params[:note][:coverpicture].present?

      Dir.mkdir("app/assets/images/notes/cover/" + @note.id.to_s)

      @note.coverpicture = params[:note][:coverpicture].original_filename
      File.open("app/assets/images/notes/cover/#{@note.id.to_s}/#{@note.coverpicture}", 'w+b') { |f|
        f.write(params[:note][:coverpicture].read)
      }
    end
    
    if params[:note][:picture].present?

      Dir.mkdir("app/assets/images/notes/contents/" + @note.id.to_s)

      if params[:note][:picture][1].nil?
        @note.picture = params[:note][:picture][0].original_filename
        File.open("app/assets/images/notes/contents/#{@note.id.to_s}/#{@note.picture}", 'w+b') { |f|
        f.write(params[:note][:picture][0].read)
        }
      else
        params[:note][:picture].each do |picture|
          File.open("app/assets/images/notes/contents/#{@note.id.to_s}/#{picture.original_filename}", 'w+b') { |f|
          f.write(picture.read)
          }
        end
      end
    end  



    respond_to do |format|
      if @note.save
        format.html { redirect_to notes_path }
        format.json { render :index, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
 
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    @note = Note.find(params[:id])
    @note.title = params[:note][:title]
    @note.picture = params[:note][:picture]
    @note.coverpicture = params[:note][:coverpicture]
    @note.extra = params[:note][:extra]
    @note.good = params[:note][:good]
    @note.release = params[:note][:release]


    if params[:note][:coverpicture].present?
      @note.coverpicture = params[:note][:coverpicture].original_filename
logger.debug "ノート表紙画像" + @note.coverpicture
      File.open("app/assets/images/notes/cover/#{@note.coverpicture}", 'w+b') { |f|
        f.write(params[:note][:coverpicture].read)
      }
    end

    if params[:note][:picture].present?
      @note.picture = params[:note][:picture].original_filename
logger.debug "ノート画像" + @note.picture
      File.open("app/assets/images/notes/contents/#{@note.picture}", 'w+b') { |f|
        f.write(params[:note][:picture].read)
      }
    end


    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: 'ノートを変更しました' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'ノートを削除しました' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit( :user_id, :title, {picture: []}, :coverpicture, :grade_id, :subject_id, :extra, :good, :release)
    end
end
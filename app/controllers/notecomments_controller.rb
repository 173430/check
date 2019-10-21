class NotecommentsController < ApplicationController
  before_action :set_notecomment, only: [:show, :edit, :update, :destroy]

  # GET /notecomments
  # GET /notecomments.json
  def index
    @notecomments = Notecomment.all
  end

  # GET /notecomments/1
  # GET /notecomments/1.json
  def show
  end

  # GET /notecomments/new
  def new
    @notecomment = Notecomment.new
  end

  # GET /notecomments/1/edit
  def edit
  end

  # POST /notecomments
  # POST /notecomments.json
  def create
    @notecomment = Notecomment.new(notecomment_params)

    respond_to do |format|
      if @notecomment.save
        format.html { redirect_to @notecomment, notice: 'Notecomment was successfully created.' }
        format.json { render :show, status: :created, location: @notecomment }
      else
        format.html { render :new }
        format.json { render json: @notecomment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notecomments/1
  # PATCH/PUT /notecomments/1.json
  def update
    respond_to do |format|
      if @notecomment.update(notecomment_params)
        format.html { redirect_to @notecomment, notice: 'Notecomment was successfully updated.' }
        format.json { render :show, status: :ok, location: @notecomment }
      else
        format.html { render :edit }
        format.json { render json: @notecomment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notecomments/1
  # DELETE /notecomments/1.json
  def destroy
    @notecomment.destroy
    respond_to do |format|
      format.html { redirect_to notecomments_url, notice: 'Notecomment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notecomment
      @notecomment = Notecomment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notecomment_params
      params.require(:notecomment).permit(:note_id, :user_id, :comment, :picture)
    end
end

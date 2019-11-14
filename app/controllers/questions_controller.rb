class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    @search_params = question_search_params
    logger.debug 'Question:Index'
    logger.debug @search_params[:search]
    @questions = Question.search(@search_params)
  end

  #private

  def question_search_params
    params.fetch(:search, {}).permit(:search, :solve)
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    @question.question = params[:question][:question]
    @question.grade = params[:question][:grade]
    @question.subject_id = params[:question][:subject_id]
    @question.picture = params[:question][:picture]
    @question.nameless = params[:question][:nameless]
    @question.solve = params[:question][:solve]
    
    if params[:question][:picture].present?
      @question.picture = params[:question][:picture].original_filename
      logger.debug @question.picture
      File.open("app/assets/images/q&a/questions/#{@question.picture}", 'w+b') { |f|
        f.write(params[:question][:picture].read)
    }
    end

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    @question = Question.find(params[:id])
    @question.question = params[:question][:question]
    @question.grade = params[:question][:grade]
    @question.subject_id = params[:question][:subject_id]
    @question.picture = params[:question][:picture]
    @question.nameless = params[:question][:nameless]
    @question.solve = params[:question][:solve]

    if params[:question][:picture].present?
      @question.picture = params[:question][:picture].original_filename
      logger.debug @question.picture
      File.open("app/assets/images/q&a/questions/#{@question.picture}", 'w+b') { |f|
        f.write(params[:question][:picture].read)
    }
    end

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: '質問を削除しました' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:question, :grade, :subject_id, :picture, :nameless, :solve)
    end
end

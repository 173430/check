class NotegoodsController < ApplicationController
  before_action :set_notegood, only: [:show, :edit, :update, :destroy]

  # GET /notegoods
  # GET /notegoods.json
  def index
    @notegoods = Notegood.all
  end

  # GET /notegoods/1
  # GET /notegoods/1.json
  def show
  end

  # GET /notegoods/new
  def new
    @notegood = Notegood.new
  end

  # GET /notegoods/1/edit
  def edit
  end

  # POST /notegoods
  # POST /notegoods.json
  def create
    @notegood = Notegood.new(notegood_params)

    respond_to do |format|
      if @notegood.save
        format.html { redirect_to @notegood, notice: 'Notegood was successfully created.' }
        format.json { render :show, status: :created, location: @notegood }
      else
        format.html { render :new }
        format.json { render json: @notegood.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notegoods/1
  # PATCH/PUT /notegoods/1.json
  def update
    respond_to do |format|
      if @notegood.update(notegood_params)
        format.html { redirect_to @notegood, notice: 'Notegood was successfully updated.' }
        format.json { render :show, status: :ok, location: @notegood }
      else
        format.html { render :edit }
        format.json { render json: @notegood.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notegoods/1
  # DELETE /notegoods/1.json
  def destroy
    @notegood.destroy
    respond_to do |format|
      format.html { redirect_to notegoods_url, notice: 'Notegood was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notegood
      @notegood = Notegood.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notegood_params
      params.require(:notegood).permit(:user_id, :note_id)
    end
end

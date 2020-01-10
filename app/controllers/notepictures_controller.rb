class NotepicturesController < ApplicationController
  before_action :set_notepicture, only: [:show, :edit, :update, :destroy]

  # GET /notepictures
  # GET /notepictures.json
  def index
    @notepictures = Notepicture.all
  end

  # GET /notepictures/1
  # GET /notepictures/1.json
  def show
  end

  # GET /notepictures/new
  def new
    @notepicture = Notepicture.new
  end

  # GET /notepictures/1/edit
  def edit
  end

  # POST /notepictures
  # POST /notepictures.json
  def create
    @notepicture = Notepicture.new(notepicture_params)

    respond_to do |format|
      if @notepicture.save
        format.html { redirect_to @notepicture, notice: 'Notepicture was successfully created.' }
        format.json { render :show, status: :created, location: @notepicture }
      else
        format.html { render :new }
        format.json { render json: @notepicture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notepictures/1
  # PATCH/PUT /notepictures/1.json
  def update
    respond_to do |format|
      if @notepicture.update(notepicture_params)
        format.html { redirect_to @notepicture, notice: 'Notepicture was successfully updated.' }
        format.json { render :show, status: :ok, location: @notepicture }
      else
        format.html { render :edit }
        format.json { render json: @notepicture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notepictures/1
  # DELETE /notepictures/1.json
  def destroy
    @notepicture.destroy
    respond_to do |format|
      format.html { redirect_to notepictures_url, notice: 'Notepicture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notepicture
      @notepicture = Notepicture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notepicture_params
      params.require(:notepicture).permit(:note_id, :picture, :disp_order)
    end
end

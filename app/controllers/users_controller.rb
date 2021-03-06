class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])
    #@user.icon = params[:user][:icon]
    #@user.id = params[:user][:id]



    unless File.exist?("app/assets/images/mypage/icons/" + @user.id.to_s)
      Dir.mkdir("app/assets/images/mypage/icons/" + @user.id.to_s)
    end

    if params[:user][:icon].present?
      @user.icon = params[:user][:icon].original_filename
      File.open("app/assets/images/mypage/icons/#{@user.id.to_s}/#{@user.icon}", 'w+b') { |f|
        f.write(params[:user][:icon].read)
      }
    else
      @user.icon = nil 
    end

    respond_to do |format|
      if @user.update(icon: @user.icon, name: params[:user][:name], introduce: params[:user][:introduce], release: params[:user][:release])
        format.html { redirect_to @user, notice: '編集を確定しました' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:classroom_id, :userid, :name, :icon, :introduce, :password, :release)
    end
end


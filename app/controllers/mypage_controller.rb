class MypageController < ApplicationController

  def profile
    @user = current_user
    logger.debug 'カレントユーザ'
    logger.debug @user.userid
    #@user = User.where("userid='@userid'")
  end

  def edit

    @user = current_user
    
  end

  def update

    @user = current_userS
    
    if params[:user][:icon].present?
      @user.icon = params[:user][:icon].original_filename
      File.open("app/assets/images/icons/private/#{@user.icon}", 'w+b') { |f|
        f.write(params[:user][:icon].read)
      }
    end

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'ノートを変更しました' }
        #format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

end

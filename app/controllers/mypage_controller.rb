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

  def passwordcheck

    @user = current_user
  
  end

  def passwordequal
    @user = current_user
    flash[:alart] = nil

    respond_to do |format|
      if current_user.password == params[:user][:password]
        format.html { redirect_to mypage_passwordedit_path }
        #format.json { render :index, status: :created, location: @note }
      else
        flash[:alart] = 'パスワードが違います'
        format.html { render :passwordcheck }
        #format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def passwordedit
    @user = current_user
  end

  def editcheck
    @user = current_user
    respond_to do |format|
      if params[:user][:password] == params[:user][:subpassword]
        format.html { redirect_to action: 'completed' }
      else
        format.html { render :passwordedit }
      end
    end
  end

  def completed
    @user = current_user
  end

end

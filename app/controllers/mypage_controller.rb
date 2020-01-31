class MypageController < ApplicationController
  #before_action :require_login

  def profile
    @user = current_user
    logger.debug 'カレントユーザ'
    #@user = User.where("userid='@userid'")
  end

  def edit

    @user = current_user
    
  end

  def mynote
    @user = current_user
    @notes = Note.where(user_id: @user.id)
  end

  def mychat
    @user = current_user
    @groups = Group.all
  end

  def myquestion
    @user = current_user
    @questions = Question.where(user_id: @user.id)

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
        @user.password = params[:user][:password]
        @user.save
        format.html { redirect_to action: 'completed' }
      else
        flash[:alart] = 'パスワードが違います'
        format.html { render :passwordedit }
      end
    end
  end

  def completed
    @user = current_user
  end

end

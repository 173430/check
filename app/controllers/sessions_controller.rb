class SessionsController < ApplicationController

  def new
  end
    
  def create
    user = User.find_by(userid: params[:session][:userid])
    logger.debug 'パスワード ' + user.password
      #セッション情報に含まれているメールアドレスをもとに、Usersテーブルに保存されているUserオブジェクトを抽出
    if user && user.password == params[:session][:password]
      logger.debug 'ログインメソッド呼び出し前'
       #Userオブジェクトが抽出できる（つまり、Usersテーブルに存在している）かつ（&&）
       #paramsで送られてきたセッションの中のパスワード（ハッシュ化されている）が
       #DB内のハッシュ化されたpassword_digestカラムの値と一致しているかどうかを検証することで、ユーザーを識別
       log_in user
       logger.debug 'ログインメソッド呼び出し後'
       redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      logger.debug 'else後'
      render 'new'
    end
  end

  def destroty
    log_out
    redirect_to root_url
  end
end

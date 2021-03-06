# app/helpers/sessions_helper.rb
module SessionsHelper

  def log_in(user)
    session[:user_id] = user.userid
  end

  #現在ログインしているユーザを返す
  def current_user
    @current_user ||= User.find_by(userid: session[:user_id])
    #@current_userに何も代入されていない時だけfind_byを呼び出して変数に格納することで、
    #同じユーザーから複数回このメソッドを呼び出された際に、都度DBに問い合わせる必要がなくなる。
    #始めは当然@current_userはnilなので、セッション情報に含まれるuser_idに紐づくUserオブジェクトを抽出し、変数に代入するという処理が行われる
    logger.debug 'セッションヘルパー'
    logger.debug @current_user
    logger.debug session[:user_id]
    @current_user ||= User.find_by(userid: session[:user_id])
  end

  def logged_in?
    return !current_user.nil?
    #ログイン中の状態＝セッションにユーザーが存在する＝current_userがnilでない状態。
  end

  def log_out
   session.delete(:user_id) #セッションからユーザーIDを削除
   @current_user = nil      #現在のユーザーをnilに設定
  end
end

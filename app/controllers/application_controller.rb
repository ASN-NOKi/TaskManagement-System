class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  

  def request_path         # 参考URL：https://qiita.com/toduq/items/a9fa48926b060b2d8a5b
    @path = controller_path + '#' + action_name

    def @path.is(*str)      # '*'は引数に配列を指定？？
      str.map{|s| self.include?(s)}.include?(true)
    end
  end
  
  def logged_in_user
    unless logged_in?
      flash[:danger] = "ログインしてください。"
      redirect_to login_url
    end
  end
  
  def admin_user
    redirect_to root_url unless current_user.admin?
  end
  
  def correct_user
    redirect_to(root_url) unless current_user?(@user)
  end
  
  def already_login
    if logged_in?
      flash[:info] = "すでにログインしています。"
      redirect_to user_url(current_user) 
    end
  end
  
  
end

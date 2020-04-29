class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
 

  def request_path         # 参考URL：https://qiita.com/toduq/items/a9fa48926b060b2d8a5b
    @path = controller_path + '#' + action_name

    def @path.is(*str)      # '*'は引数に配列を指定？？
      str.map{|s| self.include?(s)}.include?(true)
    end
  end
  
  
  # def set_user
  #   @user = User.find(params[:id])
  # end
  
  
end

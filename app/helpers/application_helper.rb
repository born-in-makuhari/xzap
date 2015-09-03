# 便利メソッド
#
module ApplicationHelper
  def loggedin
    login?
  end

  # ログインしているユーザーを返す
  # キャッシュする
  def login?
    @loggedin ||= Account.find_by session[:account]
  end
end

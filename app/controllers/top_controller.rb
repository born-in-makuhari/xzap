# トップページ
# トップページに登録・ログインがあるので、
# Accountとの関係が深い。
class TopController < ApplicationController
  def index
    @account = Account.new(flash[:account])
  end
end

# アカウントはトレーナーまたはトレーニー
class AccountsController < ApplicationController
  # ----------------------------------------------------------------------------
  # ルーティング先

  before_action :set_account, only: :show
  before_action :check_login, only: :show

  # 登録またはログイン
  def create
    account = Account.new(account_params)
    already = Account.find_by_email account.email

    if already
      create_as_login account, already
    else
      create_as_signup account
    end
  end

  # ダッシュボード
  def show
  end

  private

  # ----------------------------------------------------------------------------
  # 共通的

  def account_params
    params.require(:account).permit(:email, :password, :name, :type)
  end

  def set_account
    @account = Account.find params[:id]
  end

  def check_login
    redirect_to root_path && return unless login?
  end

  # ----------------------------------------------------------------------------
  # 処理代行

  def create_as_signup(account)
    account.type = :trainee
    if account.save
      # 登録成功したらログイン
      session[:account] = account.id
      message 'shared/register_success'
      message 'shared/login_success'
      redirect_to account_path account
    else
      message 'shared/register_error'
      redirect_to root_path, flash: { account: account }
    end
  end

  def create_as_login(account, already)
    if account.same? already
      session[:account] = already.id
      message 'shared/login_success'
      redirect_to account_path already
    else
      message 'shared/login_error'
      redirect_to root_path, flash: { account: account }
    end
  end
end

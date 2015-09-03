# アカウントはトレーナーまたはトレーニー
class AccountsController < ApplicationController
  def create
    account = Account.new(account_params)
    account.type = :trainee
    if account.save
      redirect_to account_path account
    else
      redirect_to root_path, flash: { account: account }
    end
  end

  private

  def account_params
    params.require(:account).permit(:email, :password, :name, :type)
  end
end

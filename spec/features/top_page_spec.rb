require 'rails_helper'

describe 'Top page' do

  context '開いた時、' do
    before do
      visit '/'
    end
    it 'アプリ名を表示する' do
      expect(page).to have_css 'h1', text: 'Xzap'
    end
  end

  # アカウントフォームを送信する処理の共通化
  shared_context :send_account_form_with do |email, password|
    before do
      visit '/'
      fill_in 'account_email', with: email
      fill_in 'account_password', with: password
      find('input[type=submit]').click
    end
  end

  context '登録済みメールアドレスと、誤ったアカウント情報を送信した場合、' do
    let(:newcomer) { Account.first! }
    include_context :send_account_form_with, 'email@email.com', 'password'
    include_context :send_account_form_with, 'email@email.com', 'passwordmiss'
    after { Account.destroy_all }

    it 'アカウントは増えない' do
      expect(Account.count).to be 1
    end

    it 'トップページへ移動する' do
      expect(current_path).to eq '/'
    end

    it 'すでにログインしているのでは？と表示'
    it 'ログインに失敗したと表示'
  end

  context 'すでにあるメールアドレスと、正しいパスワードを送信した場合' do
    let(:newcomer) { Account.first! }
    include_context :send_account_form_with, 'email@email.com', 'password'
    include_context :send_account_form_with, 'email@email.com', 'password'
    after { Account.destroy_all }

    it 'アカウントは１件' do
      expect(Account.count).to be 1
    end

    it 'ダッシュボードへ移動する' do
      expect(current_path).to eq "/accounts/#{newcomer.id}"
    end

    it 'ログインして、メールアドレスが表示されている。' do
      expect(page).to have_css '#account', text: 'email@email.com'
    end

    it 'ログイン成功したと表示'
  end

  context '新しいメールアドレスと、形式が間違っている情報を送信した場合'

  context '新しいメールアドレスと、形式が正しい情報を送信した場合' do
    let(:newcomer) { Account.first! }
    include_context :send_account_form_with, 'email@email.com', 'password'
    after { Account.destroy_all }

    it 'アカウントは１件' do
      expect(Account.count).to be 1
    end

    it 'トレーニーとして登録する' do
      expect(newcomer.email).to eq 'email@email.com'
      expect(newcomer.password).to eq 'password'
      expect(newcomer.type).to eq 'trainee'
    end

    it 'ダッシュボードへ移動する' do
      expect(current_path).to eq "/accounts/#{newcomer.id}"
    end

    it 'ログインして、メールアドレスが表示されている。' do
      expect(page).to have_css '#account', text: 'email@email.com'
    end

    it '登録成功したと表示'
    it 'ログイン成功したと表示'
  end
end

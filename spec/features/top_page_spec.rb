require 'rails_helper'

describe 'Top page' do

  before { visit '/' }
  it 'アプリ名を表示する' do
    expect(page).to have_css 'h1', text: 'Xzap'
  end

  shared_context :send_account_form_with do |email, password|
    before do
      visit '/'
      fill_in 'email', with: email
      fill_in 'password', with: password
      find('input[type=submit]').click
    end
  end

  context do
    include_context :send_account_form_with, 'email@email.com', 'password'
    it 'ユーザー登録する' do
      expect(User.first(email: 'email@email.com')).not_to eq nil
    end
  end
end

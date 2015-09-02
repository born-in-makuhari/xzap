require 'rails_helper'

describe 'Top page' do
  before { visit '/' }
  it 'アプリ名を表示する' do
    expect(page).to have_css 'h1', text: 'Xzap'
  end
  it 'ロゴを表示する' do
    expect(page.find('img#logo')['src']).to eq '/images/xzap-logo.png'
  end
end

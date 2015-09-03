require 'rails_helper'

RSpec.describe Account, type: :model do
  describe :same? do
    let(:account) { Account.new }
    let(:other) { Account.new }
    subject { account.same? other }

    before do
      account.email = 'email.email@email.com'
      account.password = 'passwordofaccount'
    end

    context 'emailが同じ' do
      before { other.email = account.email }
      context 'パスワードが同じ' do
        before { other.password = account.password }
        it { is_expected.to be true }
      end
      context 'パスワードが違う' do
        before { other.password = 'differentpassword' }
        it { is_expected.to be false }
      end
    end

    context 'emailが違う' do
      before { other.email = 'different@email.com' }
      context 'パスワードが同じ' do
        before { other.password = account.password }
        it { is_expected.to be false }
      end
      context 'パスワードが違う' do
        before { other.password = 'differentpassword' }
        it { is_expected.to be false }
      end
    end
  end
end

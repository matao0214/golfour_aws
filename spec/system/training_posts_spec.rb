require 'rails_helper'

describe '練習記録投稿機能', type: :system do
  let(:user_a) { FactoryBot.create(:user, nickname: 'ユーザーA', email: 'a@example.com') }
  let!(:training_post_a) { FactoryBot.create(:training_post, training_impression: 'RSpecテスト', user: user_a) }

  before do
    visit login_path
    fill_in 'session_email', with: login_user.email
    fill_in 'session_password', with: login_user.password
    click_button 'ログインする'
  end

  describe '一覧表示機能' do
    context 'ユーザーAがログインしているとき' do
      let(:login_user) { user_a }
      it 'ユーザーAが作成した練習記録が表示される' do
        expect(page).to have_content 'RSpecテスト'
      end
    end
  end
end

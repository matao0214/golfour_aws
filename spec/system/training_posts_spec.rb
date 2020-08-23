require 'rails_helper'

describe '練習記録投稿機能', type: :system do
  describe '投稿一覧表示機能' do
    before do
      # ユーザーAを作成しておく
      user_a = FactoryBot.create(:user, nickname: 'ユーザーA', email: 'a@example.com')
      # 作成者がユーザーAである練習記録を作成しておく
      FactoryBot.create(:training_post, training_impression: 'RSpecテスト', user: user_a)
    end
    context 'ユーザーAがログインしているとき' do
      before do
        # ユーザーAでログインする
        visit login_path
        fill_in 'session_email', with: 'a@example.com'
        fill_in 'session_password', with: 'password'
        click_button 'ログインする'
      end
      it 'ユーザーAが作成した練習記録が表示される' do
        # 作成済の練習記録が画面上に表示されていることを確認
        expect(page).to have_content 'RSpecテスト'
      end
    end
  end
end

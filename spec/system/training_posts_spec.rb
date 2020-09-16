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

  shared_examples_for 'ユーザーAが投稿した練習記録が表示される' do
    it { expect(page).to have_content 'RSpecテスト' }
  end

  describe '一覧表示機能' do
    context 'ユーザーAがログインしているとき' do
      let(:login_user) { user_a }
      it_behaves_like 'ユーザーAが投稿した練習記録が表示される'
    end
  end

  describe '投稿詳細表示機能' do
    context 'ユーザーAがログインしているとき' do
      let(:login_user) { user_a }
      before do 
        visit user_path(user_a)
      end
      it_behaves_like 'ユーザーAが投稿した練習記録が表示される'
    end
  end
end

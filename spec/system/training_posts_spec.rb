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

  describe '投稿一覧表示機能' do
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

  describe '新規投稿機能', js: true do
    let(:login_user) { user_a }
    before do
      visit new_training_post_path
      # 入力必須項目
      fill_in '練習時間', with: training_time
      fill_in '練習で打った球数', with: training_hits
      fill_in 'address', with: address
      # 入力任意項目
      check '球が上手く当たらない'
      fill_in 'training_post_training_impression', with: '新規投稿のテストを書く'
      click_button '投稿する'
    end

    context '投稿画面で必須項目を入力したとき' do
      let(:training_time) { 2 }
      let(:training_hits) { 150 }
      let(:address) { '筑波ジャンボゴルフセンター' }

      it '正常に投稿される' do
        expect(page).to have_selector '.alert-success', text: '投稿しました。'
      end
    end

    context '投稿画面で必須項目を入力しなかったとき' do
      let(:training_time) { '' }
      let(:training_hits) { '' }
      let(:address) { '' }

      it 'エラーが表示される' do
        within '#error_explanation' do
          expect(page).to have_content '練習場所を入力してください'
          expect(page).to have_content '練習時間を入力してください'
          expect(page).to have_content '練習で打った球数を入力してください'
        end
      end
    end
  end
end

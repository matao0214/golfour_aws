require 'rails_helper'

describe 'ユーザー機能', type: :system do
  let!(:user_a) { FactoryBot.create(:user) }
  before do
    visit login_path
    fill_in 'session_email', with: user_a.email
    fill_in 'session_password', with: user_a.password
    click_button 'ログインする'
  end
  describe 'ユーザー詳細機能' do
    context 'ヘッダーのユーザー詳細画面を押したとき' do
      it 'ユーザー詳細画面が表示される' do
        visit user_path(user_a)
        expect(page).to have_content user_a.nickname
        expect(page).to have_content user_a.golf_reki
        expect(page).to have_content user_a.goal
      end
    end
  end

  describe 'ユーザー編集機能' do
    before do
      visit user_path(user_a)
      visit edit_user_path(user_a)
      fill_in 'ユーザー名', with: edit_nickname
      fill_in 'メールアドレス', with: edit_email
      click_button '登録する'
    end
    
    context '有効なユーザー情報を編集したとき' do
      let(:edit_nickname) { 'edit_user' }
      let(:edit_email) { 'edit_email' }
      it '正常に編集される' do
        expect(page).to have_selector '.alert-success', text: 'ユーザー「edit_user」を更新しました。'
      end
    end

    context 'ユーザー名とメールアドレスを空欄に編集したとき' do
      let(:edit_nickname) { '' }
      let(:edit_email) { '' }
      it 'エラーが表示される' do
        within '#error_explanation' do
          expect(page).to have_content 'ユーザー名を入力してください'
          expect(page).to have_content 'メールアドレスを入力してください'
        end
      end
    end
  end      
end

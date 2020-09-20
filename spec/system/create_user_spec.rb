require 'rails_helper'

describe 'ユーザー作成機能', type: :system do
  let!(:user_a) { FactoryBot.create(:user, email: 'test1@example.com') }
  before do
    visit new_user_path
    fill_in 'ユーザー名', with: nickname
    fill_in 'メールアドレス', with: email
    fill_in 'パスワード', with: password
    fill_in 'パスワード(確認)', with: password_digest
    select '未経験', from: 'ゴルフ歴'
    click_button '登録する'
  end

  describe 'ユーザー新規登録' do
    context '必須項目を入力しているとき' do
      let(:nickname) { 'テストユーザー' }
      let(:email) { 'test2@example.com' }
      let(:password) { 'password' }
      let(:password_digest) { 'password_digest' }
      it '正常に登録される' do
        expect(page).to have_selector '.alert-success', text: 'ユーザー「テストユーザー」を登録しました。'
      end
    end

    context '必須項目を入力していないとき' do
      let(:nickname) { '' }
      let(:email) { '' }
      let(:password) { '' }
      let(:password_digest) { '' }
      it 'エラーが表示される' do
        within '#error_explanation' do
          expect(page).to have_content 'パスワードを入力してください'
          expect(page).to have_content 'ユーザー名を入力してください'
          expect(page).to have_content 'メールアドレスを入力してください'
        end
      end
    end

    context '既に登録されているメールアドレスを入力したとき' do
      let(:nickname) { 'テストユーザー' }
      # 冒頭で予め作成したユーザーのemailと同じ値を入力
      let(:email) { 'test1@example.com' }
      let(:password) { 'password' }
      let(:password_digest) { 'password_digest' }
      it 'エラーが表示される' do
        within '#error_explanation' do
          expect(page).to have_content 'メールアドレスはすでに存在します'
        end
      end
    end

    context 'ユーザー名を文字数の上限を超えて入力したとき' do
      let(:nickname) { '12345678901' }
      let(:email) { 'test2@example.com' }
      let(:password) { 'password' }
      let(:password_digest) { 'password_digest' }
      it 'エラーが表示される' do
        within '#error_explanation' do
          expect(page).to have_content 'ユーザー名は10文字以内で入力してください'
        end
      end
    end
  end
end

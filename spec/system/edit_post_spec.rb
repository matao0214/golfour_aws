require 'rails_helper'

describe '投稿内容編集機能', type: :system do
  let!(:user) { FactoryBot.create(:user, email: 'edit_post@example.com') }

  before do
    # ログインする
    visit login_path
    fill_in 'session_email', with: user.email
    fill_in 'session_password', with: user.password
    click_button 'ログインする'
    # 練習記録を投稿
    click_on '練習記録を投稿'
    fill_in '練習時間', with: 1
    fill_in '練習で打った球数', with: 100
    Geocoder.configure(lookup: :test)
    Geocoder::Lookup::Test.add_stub(
      '筑波ジャンボゴルフセンター', [
        {
          'coordinates' => [40.7143528, -74.0059731],
          'address' => '筑波ジャンボゴルフセンター'
        }
      ]
    )
    fill_in 'address', with: '筑波ジャンボゴルフセンター'
    # 入力任意項目
    check '球が上手く当たらない'
    fill_in 'training_post_training_impression', with: '新規投稿のテストを書く'
    click_button '投稿する'
    # 投稿詳細画面へ
    click_link '新規投稿のテストを書く'
  end

  describe '投稿内容を編集' do
    before do
      click_link '編集'
      fill_in 'training_post_training_impression', with: '編集出来ました'
      click_on '投稿する'
    end
    context '編集したとき' do
      it '正常に編集される' do
        expect(page).to have_selector '.alert-success', text: '投稿を編集しました。'
        expect(page).to have_content '編集出来ました'
      end
    end
  end  

  describe '投稿内容を削除' do
    before do
      click_on '削除'
      # confirmダイアログでOKを選択する
      page.driver.browser.switch_to.alert.accept
    end
    context '削除したとき' do
      it '正常に削除される' do
        expect(page).to have_selector '.alert-success', text: '投稿を削除しました。'
        expect(page).to have_no_content '新規投稿のテストを書く'
      end
    end
  end  
end

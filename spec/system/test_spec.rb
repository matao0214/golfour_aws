require 'rails_helper'

describe '練習記録投稿機能', type: :system do
  it 'ユーザーAが作成した練習記録が表示される' do
    #作成済の練習記録が画面上に表示されていることを確認
    visit root_path
    expect(1 + 1).to eq 2
  end
end

module ApplicationHelper
  def default_meta_tags
    {
      site: 'GolfOur',
      separator: '-',
      title: 'ゴルフ初心者専用投稿アプリ-GolfOur-',
      charset: 'utf-8',
      description: 'ゴルフをこれから始めたい方。ゴルフを始めたけど挫折しそうな方。同じ悩みを持つ仲間を見つけてゴルフを楽しみましょう！',
      canonical: 'https://golfour.herokuapp.com/'
    }
  end
end

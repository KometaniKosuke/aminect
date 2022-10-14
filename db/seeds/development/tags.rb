music = Tag.create(name: "音楽")
tv = Tag.create(name: "テレビ")
gourmet = Tag.create(name: "グルメ")
trip = Tag.create(name: "お出かけ")
game = Tag.create(name: "ゲーム")
sports = Tag.create(name: "スポーツ")
fashion = Tag.create(name: "ファッション")
pet = Tag.create(name: "ペット")
reading = Tag.create(name: "読書")
cartoon = Tag.create(name: "アニメ・漫画")
sns = Tag.create(name: "SNS")
beauty = Tag.create(name: "美容")

["K-pop","J-pop","アイドル","ロック","ヒップホップ","アニソン ボカロ","洋楽"].each do |name| #7
  music.children.create(name: name)
end
["ディズニー作品","マーベル","ジブリ","ドラマ","PIXAR","韓ドラ","ホラー","お笑い"].each do |name| #8
  tv.children.create(name: name)
end
["寿司","焼肉","ラーメン","カフェ","居酒屋","スイーツ","韓国料理","中華","イタリアン"].each do |name|  #9
  gourmet.children.create(name: name)
end
["ドライブ ツーリング","ショッピング","旅行","カラオケ","動物園・水族館","ライブ コンサート","遊園地","ディズニーリゾート","USJ","富士急"].each do |name|  #10
  trip.children.create(name: name)
end
["音ゲー","FPS","RPG","ポケモン","APEX","スマブラ","スプラトゥーン","カードゲーム","どう森","マリオ","ソシャゲ"].each do |name|  #11
  game.children.create(name: name)
end
["スポーツ全般","スキー・スノボ","サッカー","野球","バレーボール","ラケット競技","ダーツ ビリヤード ボーリング","水泳","バスケ","陸上","筋トレ"].each do |name| #11
  sports.children.create(name: name)
end
["カジュアル","きれいめ","シンプル","韓国系","古着","ストリート系","地雷・量産系","清楚系","淡色"].each do |name|  #9
  fashion.children.create(name: name)
end
["犬","猫","魚","ハムスター","うさぎ"].each do |name|  #5
  pet.children.create(name: name)
end
["ラノベ","小説","エッセイ","参考書・検定書"].each do |name|  #4
  reading.children.create(name: name)
end
["ONE PIECE","SPY×FAMILY","呪術廻戦","ドラゴンボール","ドラえもん","ヒロアカ","五等分の花嫁","進撃の巨人","HUNTER×HUNTER","名探偵コナン","京アニ","エヴァ","ワールドトリガー","ジャンプ(JC)","マガジン(KC)","鬼滅の刃","ハイキュー"].each do |name| #17
  cartoon.children.create(name: name)
end
["インスタ映え","おもしろ動画","TikTok","VTuber","ゲーム実況","Youtube","歌ってみた 踊ってみた"].each do |name| #7
  sns.children.create(name: name)
end
["ネイル","メイク","スキンケア","韓国コスメ"].each do |name|  #4
  beauty.children.create(name: name)
end

csv_data = CSV.read('./app/assets/csv/tag_relation.csv')
csv_data.each do |csv|
  TagRelation.create(
    tag1_id: csv[0].to_i+12,
    tag2_id: csv[1].to_i+12,
    degree: csv[2]
  )
end

for i in 1..70 do
  UserTag.create(
    user_id: rand(17)+1,
    tag_id: rand(102)+13
  )
end

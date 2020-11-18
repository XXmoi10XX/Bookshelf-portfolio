body =
"第３回となる「Yahoo！ニュース｜本屋大賞　2020年ノンフィクション本大賞」は一次投票では書店員78人の投票があり、上位６作品が「2020年ノンフィクション本大賞」ノミネートと作品としてして決定しました。さらに、二次投票では47人の書店員がノミネート全作品を読んだ上でベスト3を推薦理由とともに投票しました。
その結果、2020年ノンフィクション本大賞に『エンド・オブ・ライフ』佐々涼子（著）、 集英社インターナショナルが決まりました。"

0.upto(9) do |idx|
  Article.create(
    title: "本屋大賞#{idx}",
    body: body,
    released_at: 8.days.ago.advance(days: idx),
    expired_at: 2.days.ago.advance(days: idx),
    member_only: (idx % 3 == 0)
  )
end

0.upto(29) do |idx|
  Article.create(
    title: "Article#{idx+10}",
    body: "blash,blash,blash...",
    released_at: 100.days.ago.advance(days: idx),
    expired_at: nil,
    member_only: false
  )
end

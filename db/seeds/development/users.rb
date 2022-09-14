names=["太郎","次郎","花子","佐藤","田中","鈴木"]
sexes=[1,1,2,3,2,1]
ugs=["経済学部","経営学部","文学部","ネットワーク情報学部","人間科学部"]

names.each_with_index do |name, idx|
  User.create(
    uid: rand(1..9)*10000+rand(10)*1000+rand(10)*100+rand(10)*10+rand(10),
    name: name,
    sex: sexes[idx],
    birthplace: "神奈川県",
    undergraduate: ugs[rand(5)],
    comment: "よろしくお願いします！",
    twitter: "@Twitter",
    instagram: "@instagram",
    tiktok: "@tiktok",
    password: "chat",
    password_confirmation: "chat"
  )
end

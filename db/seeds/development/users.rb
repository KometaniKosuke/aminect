names=["太郎","次郎","花子","佐藤","田中","鈴木","真司","Alex","Tom","Kevin","山田","リン","たけし","野比","野原","磯野","中島"]
ugs=["経済学部","経営学部","文学部","ネ学部","人間科学部"]

names.each_with_index do |name, idx|
  User.create(
    name: name,
    sex: rand(3)+1,
    birthplace: "神奈川県",
    undergraduate: ugs[rand(5)],
    grade: 3,
    comment: "よろしくお願いします！",
    email: "aminect@example.com",
    twitter: "@Twitter",
    instagram: "@instagram",
    # tiktok: "@tiktok",
    password: "chat",
    password_confirmation: "chat"
  )
end

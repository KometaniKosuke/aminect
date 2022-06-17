names = ["太郎","次郎","花子","佐藤","田中","鈴木"]

names.each do |name|
  User.create(
    name: name
  )
end

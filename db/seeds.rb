# coding: utf-8

User.create!( name: "管理者",
              email: "sample@email.com",
              password: "password",
              password_confirmation: "password",
              admin: true)
              
100.times do |i| 
  name = Faker::Name.name
  email= "sample-#{i}@email.com"
  password = "password"
  User.create!( name: name,
                email: email,
                password: password,
                password_confirmation: password)
end

User.create!( name: "浅野 直紀",
              email: "asano@email.com",
              password: "password",
              password_confirmation: "password")

20.times do |task|
  content = "content-#{task + 1}"
  description = "#{task + 1}-abcde"
  user_id = 1
  Task.create!(content: content,
               description: description,
               user_id: user_id)
end

10.times do |task|
  content = "テスト業務No.#{task + 1}"
  description = "No.#{task + 1}の業務です。"
  user_id = 62
  Task.create!(content: content,
               description: description,
               user_id: user_id)
end
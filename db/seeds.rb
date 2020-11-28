# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Member.create([{email: "abc@def.com", password: "123456"}, {email: "aaa@aaa.com", password: "123456"}, {email: "bbb@bbb.com", password: "123456"}])
m = Member.first
m2 = Member.last

Post.create([{title: "Mon premier post", body: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", member: m},{title: "Mon deuxieme post", body: "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb", member: m},{title: "Mon troisieme post", body: "cccccccccccccccccccccccccccccccccccccccc", member: m}])
Post.create([{title: "Mon quatrieme post", body: "zzzzzzzzzzzzzzzzzzzzzzzz", member: m2},{title: "Mon cinquieme post", body: "xxxxxxxxxxxxxxxxxxxxxxxxx", member: m2},{title: "Mon sizieme post", body: "yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy", member: m2}])
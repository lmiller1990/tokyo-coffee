# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts 'Creating users...'

lachlan = User.create!(name: 'Lachlan', email: 'lachlan@tokyo-coffee.com', password: '123123123', password_confirmation: '123123123', admin: true)
lily = User.create!(name: 'Lily', email: 'lily@tokyo-coffee.com', password: '123123123', password_confirmation: '123123123', admin: true)

puts 'Creating wards...'
chiyoda = Ward.create!(japanese_name: '千代田',  english_name: 'Chiyoda')
chou = Ward.create!(japanese_name: '中央区',  english_name: 'Chou')
minato = Ward.create!(japanese_name: '港区',  english_name: 'Minato')
shinjuku = Ward.create!(japanese_name: '新宿区',  english_name: 'Shinjuku')
bunkyo = Ward.create!(japanese_name: '文京区',  english_name: 'Bunkyo')
taito = Ward.create!(japanese_name: '台東区',  english_name: 'Taito')
sumida = Ward.create!(japanese_name: '墨田区',  english_name: 'Sumida')
koto = Ward.create!(japanese_name: '江東区',  english_name: 'Koto')
shinagawa = Ward.create!(japanese_name: '品川区',  english_name: 'Shinagawa')
meguro = Ward.create!(japanese_name: '目黒区',  english_name: 'Meguro')
ota = Ward.create!(japanese_name: '大田区',  english_name: 'Ota')
setagaya = Ward.create!(japanese_name: '世田谷区',  english_name: 'Setagaya')
shibuya = shibuya = Ward.create!(japanese_name: '渋谷区',  english_name: 'Shibuya')
nakano = Ward.create!(japanese_name: '中野区',  english_name: 'Nakano')
sugnami = Ward.create!(japanese_name: '杉並区',  english_name: 'Suginami')
toshima = Ward.create!(japanese_name: '豊島区',  english_name: 'Toshima')
kita = Ward.create!(japanese_name: '北区',  english_name: 'Kita')
arakawa = Ward.create!(japanese_name: '荒川区',  english_name: 'Arakawa')
itabashi = Ward.create!(japanese_name: '板橋区',  english_name: 'Itabashi')
nerima = Ward.create!(japanese_name: '練馬区',  english_name: 'Nerima')
adachi = Ward.create!(japanese_name: '足立区',  english_name: 'Adachi')
katsushika = Ward.create!(japanese_name: '葛飾区',  english_name: 'Katsushika')
edogawa = Ward.create!(japanese_name: '江戸川区',  english_name: 'Edogawa')

puts 'Creating districts...'
nagatacho = District.create!(japanese_name: '永田町', english_name: 'Nagatacho', ward: chiyoda )
kasumigaseki = District.create!(japanese_name: '霞ヶ関', english_name: 'Kasumigaseki', ward: chiyoda )
roppongi = District.create!(japanese_name: '六本木', english_name: 'Roppongi', ward: shibuya )
azabu_juban = District.create!(japanese_name: '麻布十番', english_name: 'Azabu Juban', ward: minato )

puts 'Creating shops...'

azabu_coffee = Shop.create!(japanese_name: '麻布コーヒー', english_name: 'Azabu Coffee', district: roppongi, description: "執筆できるて、いずれの考慮はないでもするますある。", additional_details: "休日ははやくしまるときもあります", station: "渋谷駅")

honolulu_coffee = Shop.create!(japanese_name: 'ホノルルコーヒー', english_name: 'Honolulu Coffee', district: azabu_juban, station: "渋谷駅")
blue_bottle = Shop.create!(japanese_name: 'Blue Bottle Coffee', english_name: 'Blue Bottle Coffee', district: azabu_juban, station: "銀座駅")
starbucks_azabu_juban = Shop.create!(japanese_name: 'スタバックス麻布十番店舗;', english_name: 'Starbucks Azabu Juban', district: azabu_juban, description: "執筆できるて、いずれの考慮はないでもするますある。", additional_details: "休日ははやくしまるときもあります", station: "渋谷駅")

puts 'Creating reviews...'
azabu_coffee_review = Review.create!(comment: '私は今とうていその忠告順というののためにありなた。かく生涯にぼんやり人もしかるにその講演だないだけをすれているなかっにもぼんやりありたたて、そうには飛びなけれうますない。人数がしない訳はまるで今日がもっとでしょたいた', shop: azabu_coffee, user: lachlan)

Review.create!(comment: '初めて槙君を学問酒ある程度推察に唱えな党派その年それか批評がについてお附随たたでですて、この当時は私か釣精神に聞いて、嘉納さんののに坊ちゃんの何がやはり同理解とくっついて私右にお学習を来ようにもっともお講演に見るですですば、もし同時に相当から知れうているませ事を困るべきまし。', shop: azabu_coffee, user: lachlan)

puts 'Creating photos...'
Photo.create!(link: 'shop-5.jpg', user: lachlan, shop: azabu_coffee)
Photo.create!(link: 'shop-4.jpg', user: lachlan, shop: blue_bottle)
Photo.create!(link: 'shop-2.jpg', user: lily, shop: honolulu_coffee)
Photo.create!(link: 'shop-1.jpg', user: lachlan, shop: starbucks_azabu_juban)
Photo.create!(link: 'shop-1.jpg', user: lachlan, shop: starbucks_azabu_juban)

puts 'Creating facilties...'
wifi = Facility.create!(name: 'Wifi', icon: 'wifi icon')
coffee = Facility.create!(name: 'Coffee', icon: 'coffee icon')
food = Facility.create!(name: 'Food', icon: 'food icon')
powerpoint = Facility.create!(name: 'Powerpoint', icon: 'pause circle outline ico ')


azabu_coffee.facilities << wifi
azabu_coffee.facilities << coffee
azabu_coffee.facilities << food

starbucks_azabu_juban.facilities << wifi
honolulu_coffee.facilities << coffee
blue_bottle.facilities << food
blue_bottle.facilities << wifi


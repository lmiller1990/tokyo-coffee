# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: 'Lachlan', email: 'lachlan@tokyo-coffee.com', password: '123123123', password_confirmation: '123123123', admin: true)

puts 'Creating users...'
User.create!(name: 'User', email: 'user@tokyo-coffee.com', password: '123123123', password_confirmation: '123123123', admin: true)

puts 'Creating wards...'
chiyoda = Ward.create(japanese_name: '千代田',  english_name: 'Chiyoda')
chou = Ward.create(japanese_name: '中央区',  english_name: 'Chou')
minato = Ward.create(japanese_name: '港区',  english_name: 'Minato')
shinjuku = Ward.create(japanese_name: '新宿区',  english_name: 'Shinjuku')
bunkyo = Ward.create(japanese_name: '文京区',  english_name: 'Bunkyo')
taito = Ward.create(japanese_name: '台東区',  english_name: 'Taito')
sumida = Ward.create(japanese_name: '墨田区',  english_name: 'Sumida')
koto = Ward.create(japanese_name: '江東区',  english_name: 'Koto')
shinagawa = Ward.create(japanese_name: '品川区',  english_name: 'Shinagawa')
meguro = Ward.create(japanese_name: '目黒区',  english_name: 'Meguro')
ota = Ward.create(japanese_name: '大田区',  english_name: 'Ota')
setagaya = Ward.create(japanese_name: '世田谷区',  english_name: 'Setagaya')
shibuya = shibuya = Ward.create(japanese_name: '渋谷区',  english_name: 'Shibuya')
nakano = Ward.create(japanese_name: '中野区',  english_name: 'Nakano')
sugnami = Ward.create(japanese_name: '杉並区',  english_name: 'Suginami')
toshima = Ward.create(japanese_name: '豊島区',  english_name: 'Toshima')
kita = Ward.create(japanese_name: '北区',  english_name: 'Kita')
arakawa = Ward.create(japanese_name: '荒川区',  english_name: 'Arakawa')
itabashi = Ward.create(japanese_name: '板橋区',  english_name: 'Itabashi')
nerima = Ward.create(japanese_name: '練馬区',  english_name: 'Nerima')
adachi = Ward.create(japanese_name: '足立区',  english_name: 'Adachi')
katsushika = Ward.create(japanese_name: '葛飾区',  english_name: 'Katsushika')
edogawa = Ward.create(japanese_name: '江戸川区',  english_name: 'Edogawa')

District.create(japanese_name: '永田町', english_name: 'Nagatacho', ward: chiyoda )
District.create(japanese_name: '霞ヶ関', english_name: 'Kasumigaseki', ward: chiyoda )

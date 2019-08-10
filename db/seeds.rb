# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'adding categories'
Category.delete_all
Category.create(category: 'ボルダー', order: 0)
Category.create(category: 'リード', order: 1)
Category.create(category: 'トップロープ', order: 2)
Category.create(category: 'ナガモノ', order: 3)
puts 'added categories'

puts 'adding boulder grades'
Grade.delete_all
Grade.create(grade_type: 'ボルダー', grade: '9級', order: 0)
Grade.create(grade_type: 'ボルダー', grade: '8級', order: 1)
Grade.create(grade_type: 'ボルダー', grade: '7級', order: 2)
Grade.create(grade_type: 'ボルダー', grade: '6級', order: 3)
Grade.create(grade_type: 'ボルダー', grade: '5級', order: 4)
Grade.create(grade_type: 'ボルダー', grade: '4級', order: 5)
Grade.create(grade_type: 'ボルダー', grade: '3級', order: 6)
Grade.create(grade_type: 'ボルダー', grade: '2級', order: 7)
Grade.create(grade_type: 'ボルダー', grade: '1級', order: 8)
Grade.create(grade_type: 'ボルダー', grade: '初段', order: 9)
Grade.create(grade_type: 'ボルダー', grade: '2段', order: 10)
Grade.create(grade_type: 'ボルダー', grade: '3段', order: 11)
Grade.create(grade_type: 'ボルダー', grade: '4段', order: 12)
Grade.create(grade_type: 'ボルダー', grade: '5段', order: 13)
puts 'added boulder grades'

puts 'adding boulder sub grades'
SubGrade.delete_all
SubGrade.create(grade_type: 'ボルダー', sub_grade: '+', order: 0)
puts 'added boulder sub grades'

puts 'adding route grades'
Grade.create(grade_type: 'ルート', grade: '5.5', order: 0)
Grade.create(grade_type: 'ルート', grade: '5.6', order: 1)
Grade.create(grade_type: 'ルート', grade: '5.7', order: 2)
Grade.create(grade_type: 'ルート', grade: '5.8', order: 3)
Grade.create(grade_type: 'ルート', grade: '5.9', order: 4)
Grade.create(grade_type: 'ルート', grade: '5.10', order: 5)
Grade.create(grade_type: 'ルート', grade: '5.11', order: 6)
Grade.create(grade_type: 'ルート', grade: '5.12', order: 7)
Grade.create(grade_type: 'ルート', grade: '5.13', order: 8)
Grade.create(grade_type: 'ルート', grade: '5.14', order: 9)
Grade.create(grade_type: 'ルート', grade: '5.15', order: 10)
puts 'added route grades'

puts 'adding route sub grades'
SubGrade.create(grade_type: 'ルート', sub_grade: 'a', order: 0)
SubGrade.create(grade_type: 'ルート', sub_grade: 'a/b', order: 1)
SubGrade.create(grade_type: 'ルート', sub_grade: 'b', order: 2)
SubGrade.create(grade_type: 'ルート', sub_grade: 'b/c', order: 3)
SubGrade.create(grade_type: 'ルート', sub_grade: 'c', order: 4)
SubGrade.create(grade_type: 'ルート', sub_grade: 'c/d', order: 5)
SubGrade.create(grade_type: 'ルート', sub_grade: 'd', order: 6)
puts 'added route sub grades'


puts 'adding gyms'
Gym.delete_all
Gym.create(name:'PUMP1 川口',
           name_katakana:'パンプ1 カワグチ',
           name_alphabet:'PUMP1 Kawaguchi',
           address:'埼玉県川口市元郷2-3-12',
           latitude:'',
           longitude:'')
Gym.create(name:'PUMP2 川崎',
           name_katakana:'パンプ2 カワサキ',
           name_alphabet:'PUMP2 Kawasaki',
           address:'神奈川県川崎市多摩区中野島2-9-30',
           latitude:'',
           longitude:'')
Gym.create(name:'PUMP 大阪',
           name_katakana:'パンプ オオサカ',
           name_alphabet:'PUMP Osaka',
           address:'大阪府大阪市西淀川区中島1-13-23',
           latitude:'',
           longitude:'')
Gym.create(name:'B-PUMP TOKYO 秋葉原',
           name_katakana:'ビーパンプ トウキョウ アキハバラ',
           name_alphabet:'B-PUMP TOKYO AKIHABARA',
           address:'東京都文京区湯島1-1-8',
           latitude:'',
           longitude:'')
Gym.create(name:'B-PUMP 荻窪',
           name_katakana:'ビーパンプ オギクボ',
           name_alphabet:'B-PUMP OGIKUBO',
           address:'東京都杉並区上荻1-10-12 荻窪東亜会館3F',
           latitude:'',
           longitude:'')
Gym.create(name:'B-PUMP 横浜',
           name_katakana:'ビーパンプ ヨコハマ',
           name_alphabet:'B-PUMP YOKOHAMA',
           address:'神奈川県横浜市西区平沼1-8-1  ',
           latitude:'',
           longitude:'')
Gym.create(name:"PUMP CLIMBER'S ACADEMY 新宿",
           name_katakana:'パンプクライマーズアカデミー シンジュク',
           name_alphabet:"PUMP CLIMBER'S ACADEMY SHINJUKU",
           address:'東京都新宿区新宿2-8-5 新宿第1ビル',
           latitude:'',
           longitude:'')
Gym.create(name:'ROCKY 新宿曙橋',
           name_katakana:'ロッキー シンジュクアケボノバシ',
           name_alphabet:'Rocky Shinjuku Akebonobashi',
           address:'東京都新宿区市谷台町14-6　信川ハイツB1',
           latitude:'',
           longitude:'')
Gym.create(name:'ROCKY 品川',
           name_katakana:'ロッキー シナガワ',
           name_alphabet:'Rocky Shinagawa',
           address:'東京都港区港南5-4-38　松岡品川埠頭ビル103',
           latitude:'',
           longitude:'')
Gym.create(name:'ROCKY 印西',
           name_katakana:'ロッキー インザイ',
           name_alphabet:'Rocky Inzai',
           address:'千葉県印西市原1-2BIGHOPモール棟 2F',
           latitude:'',
           longitude:'')
Gym.create(name:'ROCKY つくば阿見',
           name_katakana:'ロッキー ツクバアミ',
           name_alphabet:'Rocky Tsukuba Ami',
           address:'茨城県稲敷郡阿見町本郷3-1-1',
           latitude:'',
           longitude:'')
Gym.create(name:'ROCKY 船橋',
           name_katakana:'ロッキー フナバシ',
           name_alphabet:'Rocky Funabashi',
           address:'千葉県船橋市海神町2-225-1',
           latitude:'',
           longitude:'')
Gym.create(name:'NOBOROCK 渋谷',
           name_katakana:'ノボロック シブヤ',
           name_alphabet:'NOBOROCK Shibuya',
           address:'東京都渋谷区桜丘町9 桜丘町9-1ビアンクォードビルB1',
           latitude:'',
           longitude:'')
Gym.create(name:'NOBOROCK 池袋',
           name_katakana:'ノボロック イケブクロ',
           name_alphabet:'NOBOROCK Ikebukuro',
           address:'東京都豊島区西池袋5-13-12MKビルB1',
           latitude:'',
           longitude:'')
Gym.create(name:'NOBOROCK 町田',
           name_katakana:'ノボロック マチダ',
           name_alphabet:'NOBOROCK Machida',
           address:'東京都町田市森野 1-25-19 3F',
           latitude:'',
           longitude:'')
Gym.create(name:'NOBOROCK 溝の口',
           name_katakana:'ノボロック ミゾノクチ',
           name_alphabet:'NOBOROCK Mizonokuchi',
           address:'神奈川県川崎市高津区溝口2丁目10-22',
           latitude:'',
           longitude:'')
Gym.create(name:'NOBOROCK 大宮',
           name_katakana:'ノボロック オオミヤ',
           name_alphabet:'NOBOROCK Omiya',
           address:'埼玉県さいたま市大宮区仲町1-54-3 ビジョナリーⅢ B1',
           latitude:'',
           longitude:'')
Gym.create(name:'Base Camp 入間',
           name_katakana:'ベースキャンプ イルマ',
           name_alphabet:'Base Camp Iruma',
           address:'埼玉県入間市東町7-1-7',
           latitude:'',
           longitude:'')
Gym.create(name:'Base Camp Tokyo 小竹向原',
           name_katakana:'ベースキャンプ トウキョウ コタケムカイハラ',
           name_alphabet:'Base Camp Tokyo Kotake Mukaihara',
           address:'東京都板橋区向原3-10-15',
           latitude:'',
           longitude:'')
Gym.create(name:'Base Camp 飯能',
           name_katakana:'ベースキャンプ ハンノウ',
           name_alphabet:'Base Camp Hanno',
           address:'埼玉県飯能市緑町3-2',
           latitude:'',
           longitude:'')
puts 'added gyms'

puts 'adding statuses'
Status.delete_all
Status.create(status:'オンサイト', order: 0)
Status.create(status:'フラッシュ', order: 1)
Status.create(status:'レッドポイント', order: 2)
Status.create(status:'1テン', order: 3)
Status.create(status:'2テン', order: 4)
Status.create(status:'3テン', order: 5)
Status.create(status:'テン山', order: 6)
Status.create(status:'途中敗退', order: 6)
Status.create(status:'トライ中', order: 7)
puts 'added statuses'

puts 'adding users'
User.delete_all
User.create(email: 'admin@test.com', password: 'test1234', admin: true)
User.create(email: 'test@test.com', password: 'test1234')
puts 'added users'




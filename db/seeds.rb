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

# Hokkaido
Gym.create(name:'シグナルクライミングジム',
           name_katakana:'シグナルクライミングジム',
           name_alphabet:'Signal Climbing Gym',
           address:'北海道札幌市西区西町南12丁目1-41',
           latitude:'',
           longitude:'')
Gym.create(name:'RED POINT',
           name_katakana:'レッドポイント',
           name_alphabet:'RED POINT',
           address:'北海道中川郡池田町大通4丁目11',
           latitude:'',
           longitude:'')
Gym.create(name:'HOMIE redbrick warehouse',
           name_katakana:'ホーミーレッドブリックウェアハウス',
           name_alphabet:'HOMIE redbrick warehouse',
           address:'北海道函館市入舟町1-22',
           latitude:'',
           longitude:'')
Gym.create(name:'GRAVITY RESEARCH 札幌',
           name_katakana:'グラビティリサーチサッポロ',
           name_alphabet:'GRAVITY RESEARCH SAPPORO',
           address:'北海道札幌市中央区北2条東4丁目サッポロファクトリー1条館1F',
           latitude:'',
           longitude:'')
Gym.create(name:'Whipper Snapper Gym',
           name_katakana:'ウィッパースナッパージム',
           name_alphabet:'Whipper Snapper Gym',
           address:'北海道札幌市手稲区新発寒5条1-5-26',
           latitude:'',
           longitude:'')
Gym.create(name:'ボルダリングジム エクストリーム',
           name_katakana:'ボルダリングジム エクストリーム',
           name_alphabet:'Bouldering Gym Extreme',
           address:'北海道函館市亀田町8−44',
           latitude:'',
           longitude:'')
Gym.create(name:'GUTs WALL',
           name_katakana:'ガッツウォール',
           name_alphabet:'GUTs WALL',
           address:'北海道旭川市新星町3-1-95',
           latitude:'',
           longitude:'')
Gym.create(name:'スポーツクライミングジム十勝',
           name_katakana:'スポーツクライミングジムトカチ',
           name_alphabet:'Sport Climbing Gym Tokachi',
           address:'北海道中川郡幕別町字依田523-3',
           latitude:'',
           longitude:'')
Gym.create(name:'NAC札幌クライミングジム',
           name_katakana:'ナックサッポロクライミングジム',
           name_alphabet:'NAC Sapporo Climbing Gym',
           address:'北海道札幌市白石区東札幌3条1-1-1 イーアス札幌Aタウン1F',
           latitude:'',
           longitude:'')
Gym.create(name:'ノースケイブジム',
           name_katakana:'ノースケイブジム',
           name_alphabet:'North Cave Gym',
           address:'北海道札幌市東区北27条東20丁目',
           latitude:'',
           longitude:'')
Gym.create(name:'スポーツクライミングジム レインボークリフ',
           name_katakana:'スポーツクライミングジム レインボークリフ',
           name_alphabet:'Sport Climbing Gym Rainbow Cliff',
           address:'北海道札幌市白石区東札幌2条2-3-26',
           latitude:'',
           longitude:'')

# Aomori
Gym.create(name:'クライミングジム ノースロック',
           name_katakana:'クライミングジム ノースロック',
           name_alphabet:'Climbing Gym North Rock',
           address:'青森県三戸郡階上町蒼前東2-9-1851',
           latitude:'',
           longitude:'')
Gym.create(name:'Bouldering gym 2nd-Wally',
           name_katakana:'ボルダリングジム セカンド ウォーリー',
           name_alphabet:'Bouldering gym 2nd-Wally',
           address:'青森県八戸市石堂2-1-14',
           latitude:'',
           longitude:'')
Gym.create(name:'RAT青森ボルダー',
           name_katakana:'ラットアオモリボルダー',
           name_alphabet:'RAT Aomori Boulder',
           address:'青森県青森市牛館岡部13-1',
           latitude:'',
           longitude:'')
Gym.create(name:'フリークライミングジム ラットウォール',
           name_katakana:'フリークライミングジム ラットウォール',
           name_alphabet:'Free Climbing Gym RAT Wall',
           address:'青森県弘前市外崎2-6-9',
           latitude:'',
           longitude:'')

# Iwate
Gym.create(name:'Crager’s奥州水沢',
           name_katakana:'クレイガーズ オウシュウミズサワ',
           name_alphabet:'Crager’s Oshu Mizusawa',
           address:'岩手県奥州市水沢区横町99',
           latitude:'',
           longitude:'')
Gym.create(name:'クラムボン クライミング',
           name_katakana:'クラムボン クライミング',
           name_alphabet:'Clambon Climbing',
           address:'岩手県北上市村崎野14-457-4 2F',
           latitude:'',
           longitude:'')
Gym.create(name:'THE STONE SESSION JAZZYSPORT',
           name_katakana:'ザ ストーンセッション ジャジースポート',
           name_alphabet:'THE STONE SESSION JAZZYSPORT',
           address:'岩手県盛岡市厨川5-13-48-4',
           latitude:'',
           longitude:'')
Gym.create(name:'Climbing Spot ONE MOVE',
           name_katakana:'クライミングスポット ワンムーブ',
           name_alphabet:'Climbing Spot ONE MOVE',
           address:'岩手県盛岡市上鹿妻田貝13',
           latitude:'',
           longitude:'')

#Miyagi
Gym.create(name:'Climbing&Café　McKINLEY',
           name_katakana:'クライミングアンドカフェ マッキンリー',
           name_alphabet:'Climbing&Café　McKINLEY',
           address:'宮城県名取市愛島郷1丁目1番地1',
           latitude:'',
           longitude:'')
Gym.create(name "B'nuts 大崎古川店",
           name_katakana:'ビーナッツ オオサキフルカワテン',
           name_alphabet:"B'nuts Osaki Furukawa",
           address:'宮城県大崎市古川栄町14-14',
           latitude:'',
           longitude:'')
Gym.create(name:'クライミングジム BOLZ',
           name_katakana:'クライミングジム ボルズ',
           name_alphabet:'CLIMBING GYM BOLZ',
           address:'宮城県仙台市宮城野区萩野町2-18-10',
           latitude:'',
           longitude:'')
Gym.create(name:'モーメント・アーバンクライミングスペース',
           name_katakana:'モーメント・アーバンクライミングスペース',
           name_alphabet:'Moment Urban Climbing Space',
           address:'宮城県仙台市泉区将監3-2-18',
           latitude:'',
           longitude:'')
Gym.create(name:'うみかぜクライミングパーク Sea Monkey(Z)',
           name_katakana:'ウミカゼクライミングパーク　シーモンキー ゼッド',
           name_alphabet:'Umikaze Climbing Park Sea Monkey Z',
           address:'宮城県石巻市貞山1-9-25',
           latitude:'',
           longitude:'')
Gym.create(name:'Climbing & Bouldering ズィーボックス',
           name_katakana:'クライミングアンドボルダリング ズィーボックス',
           name_alphabet:'Climbing and Bouldering Zi;BOX',
           address:'宮城県仙台市若林区荒井字畑中31-1',
           latitude:'',
           longitude:'')
Gym.create(name:'クライミングジム ビーナッツ',
           name_katakana:'クライミングジム ビーナッツ',
           name_alphabet:"Climbing Gym B'nuts",
           address:'宮城県仙台市青葉区国分町3-3-5 リスズビル1F',
           latitude:'',
           longitude:'')

#Akita
Gym.create(name:'Climbing&Cafe Warehouse -UN ROCHER-',
           name_katakana:'クライミングアンドカフェ ウェアハウス アンロシェ',
           name_alphabet:"Climbing&Cafe Warehouse -UN ROCHER-",
           address:'秋田県鹿角市花輪字下タ町100',
           latitude:'',
           longitude:'')

Gym.create(name:'ガラパカ クライミングジム',
           name_katakana:'ガラパカ クライミングジム',
           name_alphabet:"Garapaka Climbing Gym",
           address:'秋田県秋田市八橋大畑1-3-7',
           latitude:'',
           longitude:'')

#Yamagata
Gym.create(name:'bouldering.house.358',
           name_katakana:'ボルダリングハウス サンゴーハチ',
           name_alphabet:"bouldering.house.358",
           address:'山形県山形市千歳1-15-43',
           latitude:'',
           longitude:'')
Gym.create(name:'FLAT BOULDERING',
           name_katakana:'フラットボルダリング',
           name_alphabet:"FLAT BOULDERING",
           address:'山形県山形市北町2-1-30',
           latitude:'',
           longitude:'')
Gym.create(name:'ボルダリングジム キイストーン',
           name_katakana:'Bouldering Gym Key Stone',
           name_alphabet:"ボルダリングジム キイストーン",
           address:'山形県酒田市両羽町3-9',
           latitude:'',
           longitude:'')
Gym.create(name:'ボルダリングジム キイストーン三川',
           name_katakana:'Bouldering Gym Key Stone Mikawa',
           name_alphabet:"ボルダリングジム キイストーン三川",
           address:'山形県東田川郡三川町猪子字和田庫126-1イオンモール三川内',
           latitude:'',
           longitude:'')

#Fukushima







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




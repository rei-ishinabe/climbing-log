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
Gym.create(name:'パンプ川口', name_katakana:'パンプカワグチ', name_alphabet:'Pump Kawaguchi', address:'', latitude:'', longitude:'')
Gym.create(name:'ロッキー新宿曙橋', name_katakana:'ロッキーシンジュクアケボノバシ', name_alphabet:'Rocky Shinjuku', address:'', latitude:'', longitude:'')
puts 'added gyms'


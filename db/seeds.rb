# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts '-----------------------------------------------------'
puts 'deleting all records'
puts '-----------------------------------------------------'

puts 'adding categories'
Category.create(category: 'ボルダー', order: 0)
Category.create(category: 'リード', order: 1)
Category.create(category: 'トップロープ', order: 2)
Category.create(category: 'ナガモノ', order: 3)
puts 'added categories'

puts 'adding boulder grades'
Grade.create(category_id: Category.find_by(category: 'ボルダー').id, grade: '9級', order: 0)
Grade.create(category_id: Category.find_by(category: 'ボルダー').id, grade: '8級', order: 1)
Grade.create(category_id: Category.find_by(category: 'ボルダー').id, grade: '7級', order: 2)
Grade.create(category_id: Category.find_by(category: 'ボルダー').id, grade: '6級', order: 3)
Grade.create(category_id: Category.find_by(category: 'ボルダー').id, grade: '5級', order: 4)
Grade.create(category_id: Category.find_by(category: 'ボルダー').id, grade: '4級', order: 5)
Grade.create(category_id: Category.find_by(category: 'ボルダー').id, grade: '3級', order: 6)
Grade.create(category_id: Category.find_by(category: 'ボルダー').id, grade: '2級', order: 7)
Grade.create(category_id: Category.find_by(category: 'ボルダー').id, grade: '1級', order: 8)
Grade.create(category_id: Category.find_by(category: 'ボルダー').id, grade: '初段', order: 9)
Grade.create(category_id: Category.find_by(category: 'ボルダー').id, grade: '2段', order: 10)
Grade.create(category_id: Category.find_by(category: 'ボルダー').id, grade: '3段', order: 11)
Grade.create(category_id: Category.find_by(category: 'ボルダー').id, grade: '4段', order: 12)
Grade.create(category_id: Category.find_by(category: 'ボルダー').id, grade: '5段', order: 13)
puts 'added boulder grades'

puts 'adding boulder sub grades'
SubGrade.create(category_id: Category.find_by(category: 'ボルダー').id, sub_grade: '', order: 0)
SubGrade.create(category_id: Category.find_by(category: 'ボルダー').id, sub_grade: '+', order: 1)
puts 'added boulder sub grades'

puts 'adding lead grades'
Grade.create(category_id: Category.find_by(category: 'リード').id, grade: '5.5', order: 0)
Grade.create(category_id: Category.find_by(category: 'リード').id, grade: '5.6', order: 1)
Grade.create(category_id: Category.find_by(category: 'リード').id, grade: '5.7', order: 2)
Grade.create(category_id: Category.find_by(category: 'リード').id, grade: '5.8', order: 3)
Grade.create(category_id: Category.find_by(category: 'リード').id, grade: '5.9', order: 4)
Grade.create(category_id: Category.find_by(category: 'リード').id, grade: '5.10', order: 5)
Grade.create(category_id: Category.find_by(category: 'リード').id, grade: '5.11', order: 6)
Grade.create(category_id: Category.find_by(category: 'リード').id, grade: '5.12', order: 7)
Grade.create(category_id: Category.find_by(category: 'リード').id, grade: '5.13', order: 8)
Grade.create(category_id: Category.find_by(category: 'リード').id, grade: '5.14', order: 9)
Grade.create(category_id: Category.find_by(category: 'リード').id, grade: '5.15', order: 10)
puts 'added lead grades'

puts 'adding lead sub grades'
SubGrade.create(category_id: Category.find_by(category: 'リード').id, sub_grade: '', order: 0)
SubGrade.create(category_id: Category.find_by(category: 'リード').id, sub_grade: 'a', order: 1)
SubGrade.create(category_id: Category.find_by(category: 'リード').id, sub_grade: 'a/b', order: 2)
SubGrade.create(category_id: Category.find_by(category: 'リード').id, sub_grade: 'b', order: 3)
SubGrade.create(category_id: Category.find_by(category: 'リード').id, sub_grade: 'b/c', order: 4)
SubGrade.create(category_id: Category.find_by(category: 'リード').id, sub_grade: 'c', order: 5)
SubGrade.create(category_id: Category.find_by(category: 'リード').id, sub_grade: 'c/d', order: 6)
SubGrade.create(category_id: Category.find_by(category: 'リード').id, sub_grade: 'd', order: 7)
puts 'added lead sub grades'

puts 'adding toprope grades'
Grade.create(category_id: Category.find_by(category: 'トップロープ').id, grade: '5.5', order: 0)
Grade.create(category_id: Category.find_by(category: 'トップロープ').id, grade: '5.6', order: 1)
Grade.create(category_id: Category.find_by(category: 'トップロープ').id, grade: '5.7', order: 2)
Grade.create(category_id: Category.find_by(category: 'トップロープ').id, grade: '5.8', order: 3)
Grade.create(category_id: Category.find_by(category: 'トップロープ').id, grade: '5.9', order: 4)
Grade.create(category_id: Category.find_by(category: 'トップロープ').id, grade: '5.10', order: 5)
Grade.create(category_id: Category.find_by(category: 'トップロープ').id, grade: '5.11', order: 6)
Grade.create(category_id: Category.find_by(category: 'トップロープ').id, grade: '5.12', order: 7)
Grade.create(category_id: Category.find_by(category: 'トップロープ').id, grade: '5.13', order: 8)
Grade.create(category_id: Category.find_by(category: 'トップロープ').id, grade: '5.14', order: 9)
Grade.create(category_id: Category.find_by(category: 'トップロープ').id, grade: '5.15', order: 10)
puts 'added toprope grades'

puts 'adding toprope sub grades'
SubGrade.create(category_id: Category.find_by(category: 'トップロープ').id, sub_grade: '', order: 0)
SubGrade.create(category_id: Category.find_by(category: 'トップロープ').id, sub_grade: 'a', order: 1)
SubGrade.create(category_id: Category.find_by(category: 'トップロープ').id, sub_grade: 'a/b', order: 2)
SubGrade.create(category_id: Category.find_by(category: 'トップロープ').id, sub_grade: 'b', order: 3)
SubGrade.create(category_id: Category.find_by(category: 'トップロープ').id, sub_grade: 'b/c', order: 4)
SubGrade.create(category_id: Category.find_by(category: 'トップロープ').id, sub_grade: 'c', order: 5)
SubGrade.create(category_id: Category.find_by(category: 'トップロープ').id, sub_grade: 'c/d', order: 6)
SubGrade.create(category_id: Category.find_by(category: 'トップロープ').id, sub_grade: 'd', order: 7)
puts 'added toprope sub grades'


puts 'adding nagamono grades'
Grade.create(category_id: Category.find_by(category: 'ナガモノ').id, grade: '5.5', order: 0)
Grade.create(category_id: Category.find_by(category: 'ナガモノ').id, grade: '5.6', order: 1)
Grade.create(category_id: Category.find_by(category: 'ナガモノ').id, grade: '5.7', order: 2)
Grade.create(category_id: Category.find_by(category: 'ナガモノ').id, grade: '5.8', order: 3)
Grade.create(category_id: Category.find_by(category: 'ナガモノ').id, grade: '5.9', order: 4)
Grade.create(category_id: Category.find_by(category: 'ナガモノ').id, grade: '5.10', order: 5)
Grade.create(category_id: Category.find_by(category: 'ナガモノ').id, grade: '5.11', order: 6)
Grade.create(category_id: Category.find_by(category: 'ナガモノ').id, grade: '5.12', order: 7)
Grade.create(category_id: Category.find_by(category: 'ナガモノ').id, grade: '5.13', order: 8)
Grade.create(category_id: Category.find_by(category: 'ナガモノ').id, grade: '5.14', order: 9)
Grade.create(category_id: Category.find_by(category: 'ナガモノ').id, grade: '5.15', order: 10)
puts 'added lead grades'

puts 'adding nagamono sub grades'
SubGrade.create(category_id: Category.find_by(category: 'ナガモノ').id, sub_grade: '', order: 0)
SubGrade.create(category_id: Category.find_by(category: 'ナガモノ').id, sub_grade: 'a', order: 1)
SubGrade.create(category_id: Category.find_by(category: 'ナガモノ').id, sub_grade: 'a/b', order: 2)
SubGrade.create(category_id: Category.find_by(category: 'ナガモノ').id, sub_grade: 'b', order: 3)
SubGrade.create(category_id: Category.find_by(category: 'ナガモノ').id, sub_grade: 'b/c', order: 4)
SubGrade.create(category_id: Category.find_by(category: 'ナガモノ').id, sub_grade: 'c', order: 5)
SubGrade.create(category_id: Category.find_by(category: 'ナガモノ').id, sub_grade: 'c/d', order: 6)
SubGrade.create(category_id: Category.find_by(category: 'ナガモノ').id, sub_grade: 'd', order: 7)
puts 'added nagamono sub grades'

puts 'adding gyms'
Gym.create(name:'パンプ川口', name_katakana:'パンプカワグチ', name_alphabet:'Pump Kawaguchi', address:'', latitude:'', longitude:'')
Gym.create(name:'ロッキー新宿曙橋', name_katakana:'ロッキーシンジュクアケボノバシ', name_alphabet:'Rocky Shinjuku', address:'', latitude:'', longitude:'')
puts 'added gyms'


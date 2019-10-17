puts 'Started generating grade_for_chart for each route'

Route.all.each do |route|
  if route.sub_grade_id.nil?
    route.grade_for_chart = route.grade_id.to_f
  else
    route.grade_for_chart = route.grade_id.to_f + (route.sub_grade_id.to_f / 7).round(3)
  end
  route.save
end

puts 'Completed genarating grade_for_chart for each route'

Route.all.each do |route|
  puts route.id
  puts route.grade_for_chart
end

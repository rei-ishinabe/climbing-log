puts 'Started generating grade_for_chart for each route'

Route.all.each do |route|
  if route.grade_id < 20
    route.grade_for_chart = 20 - (route.grade_id.to_f - 19) * 0.25
  else
    if route.sub_grade_id.nil?
        route.grade_for_chart = route.grade_id.to_f + 0.375
    else
      route.grade_for_chart = route.grade_id.to_f + (route.sub_grade_id.to_f - 2) * 0.125
    end
  end
  route.save
end

puts 'Completed genarating grade_for_chart for each route'

Route.all.each do |route|
  puts route.id
  puts route.grade_for_chart
end

puts 'Started generating grade_for_chart for each od_route'

OdRoute.all.each do |od_route|
  if od_route.grade_id < 20
    od_route.grade_for_chart = 20 - (od_route.grade_id.to_f - 19) * 0.25
  else
    if od_route.sub_grade_id.nil?
        od_route.grade_for_chart = od_route.grade_id.to_f + 0.375
    else
      od_route.grade_for_chart = od_route.grade_id.to_f + (od_route.sub_grade_id.to_f - 2) * 0.125
    end
  end
  od_route.save
end

puts 'Completed genarating grade_for_chart for each od_route'

OdRoute.all.each do |od_route|
  puts od_route.id
  puts od_route.grade_for_chart
end

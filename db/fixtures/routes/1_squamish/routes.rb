require 'csv'
$i = 10
Dir.glob("#{Rails.root}/db/fixtures/routes/1_squamish/*.csv").each do |f|
  CSV.read(f).each.with_index($i) do |row, i|
    Route.seed do |s|
      s.id = i
      s.rate = row[0]
      s.name = row[1]
      s.grade = row[2]
      s.style = row[3]
      s.region_id = row[4]
      s.crag_id = row[5]
      s.area_id = row[6]
      $i = 1
    end
  end
end

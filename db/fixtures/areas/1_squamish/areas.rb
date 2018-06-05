require 'csv'
$i = 1
Dir.glob("#{Rails.root}/db/fixtures/areas/1_squamish/areas.csv").each do |f|
  CSV.read(f).each.with_index($i) do |row, i|
    Area.seed do |s|
      s.id = i
      s.name = row[0]
      s.region_id = row[1]
      s.crag_id = row[2]
      $i = 1
    end
  end
end

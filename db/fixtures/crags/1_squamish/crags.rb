require 'csv'
$i = 1
Dir.glob("#{Rails.root}/db/fixtures/crags/1_squamish/crags.csv").each do |f|
  CSV.read(f).each.with_index($i) do |row, i|
    Crag.seed do |s|
      s.id = i
      s.name = row[1]
      s.region_id = row[2]
      $i = 1
    end
  end
end

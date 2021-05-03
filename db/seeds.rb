# Import regions, crags, areas and routes
require "csv"

CSV.foreach('db/seeds/csv/region.csv', headers: true) do |row|
    Region.create(
        name: row['name'],
        able: row['able']
    )
end

CSV.foreach('db/seeds/csv/crag.csv', headers: true) do |row|
    Crag.create(
        name: row['name'],
        region_id: row['region_id']
    )
end

CSV.foreach('db/seeds/csv/area.csv', headers: true) do |row|
    Area.create(
        name: row['name'],
        region_id: row['region_id'],
        crag_id: row['crag_id']
    )
end

CSV.foreach('db/seeds/csv/route.csv', headers: true) do |row|
    Route.create(
        rate: row['rate'],
        name: row['name'],
        grade: row['grade'],
        style: row['style'],
        region_id: row['region_id'],
        crag_id: row['crag_id'],
        area_id: row['area_id']
    )
end
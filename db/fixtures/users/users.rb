User.seed do |s|
  s.id = 1
  s.name = "admin"
  s.email = "admin@admin.com"
  s.password = "adminadmin"
  s.password_confirmation = "adminadmin"
end

User.seed do |s|
  s.id = 2
  s.name = "test"
  s.email = "test@test.com"
  s.password = "testtest"
  s.password_confirmation = "testtest"
end

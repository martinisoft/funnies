Fabricator(:user) do
  # username "martinisoft"
  username { Fabricate.sequence(:username) { |i| "martinisoft-#{i}" } }
  email { Fabricate.sequence(:email) { |i| "user+#{i}@example.com" } }
  password "foobar"
  password_confirmation { |f| f.password }
  confirmed_at 2.hours.ago
end

Fabricator(:admin, from: :user) do
  admin true
end

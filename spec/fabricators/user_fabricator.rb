Fabricator(:user) do
  username                "martinisoft"
  email                   "martini@soft.com"
  password                "foobar"
  password_confirmation   { |f| f.password }
  confirmed_at            2.hours.ago
end

Fabricator(:admin, from: :user) do
  after_create { |user| user.update_attribute(:admin, true) }
end

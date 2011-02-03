Factory.sequence(:email) do |i|
  "user#{i}@example.com"
end

Factory.define :user do |f|
  f.username                "martinisoft"
  f.email                   "martini@soft.com"
  f.password                "foobar"
  f.password_confirmation   { |u| u.password }
  f.confirmed_at            { 2.hours.ago }
end

Factory.define :admin, :parent => :user do |f|
  f.admin true
end

Fabricator :user do
  username { Fabricate.sequence(:username) { |i| "martinisoft-#{i}" } }
  email { Fabricate.sequence(:email) { |i| "user+#{i}@example.com" } }
  password "foobar"
  password_confirmation { |attrs| attrs[:password] }
end

Fabricator :confirmed_user, from: :user do
  after_create { |user| user.confirm! }
end

Fabricator :admin, from: :confirmed_user do
  admin true
end

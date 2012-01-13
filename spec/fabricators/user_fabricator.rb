Fabricator(:user) do
  # username "martinisoft"
  username { Fabricate.sequence(:username) { |i| "martinisoft-#{i}" } }
  email { Fabricate.sequence(:email) { |i| "user+#{i}@example.com" } }
  password "foobar"
  password_confirmation { |user| user.password }
end

Fabricator :confirmed_user, from: :user do
  after_create { |user| user.confirm! }
end

Fabricator(:admin, from: :user) do
  admin true
end

Factory.define :user, :class => User do |u|
  u.username                "martinisoft"
  u.email                   "martini@soft.com"
  u.password                "foobar"
  u.password_confirmation   "foobar"
  u.confirmed_at            Time.now
end

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

Factory.define :comic do |f|
  f.name        "xkcd"
  f.homepage    "http://xkcd.com"
  f.comic_page  "http://xkcd.com"
  f.xpath_title "id('middleContent')/div[2]/div/div/h1"
  f.xpath_image "id('middleContent')/div[2]/div/div/img"
end

Factory.define :post do |f|
  f.title "Oh my god its a blog post!"
  f.body "And it has very little content"
end

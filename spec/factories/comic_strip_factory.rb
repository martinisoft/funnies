Factory.define(:comic_strip) do |f|
  f.association :comic
  f.comic_image { File.open(Rails.root.join("spec", "fixtures", "xkcd.png")) }
end

Fabricator(:comic_strip) do
  comic
  comic_image File.open(Rails.root.join("spec", "fixtures", "xkcd.png"))
end

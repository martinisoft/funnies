Fabricator(:comic) do
  name        "xkcd"
  homepage    "http://xkcd.com"
  comic_page  "http://xkcd.com"
  xpath_title "id('middleContent')/div[2]/div/div/h1"
  xpath_image "id('middleContent')/div[2]/div/div//img"
end

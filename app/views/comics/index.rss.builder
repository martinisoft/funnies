xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "FunniesApp"
    xml.description "Your favorite web comics, all on one page"
    xml.link comics_url

    comics.each do |comic|
      xml.item do
        xml.title comic.name
        xml.description raw(image_tag(comic.comic_strips.last.comic_image_url))
        xml.pubDate comic.created_at.to_s(:rfc822)
        xml.link comic.homepage
        xml.guid comics_url
      end
    end
  end
end

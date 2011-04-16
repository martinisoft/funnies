xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    if params[:username]
      xml.title "The Funnies - #{params[:username]}'s Feed"
    else
      xml.title "The Funnies Main Feed"
    end
    xml.description "Your favorite web comics, all on one page"
    xml.link comics_url

    if comics.any?
      comics.each do |comic|
        xml.item do
          xml.title comic.name
          if comic.comic_strips.any?
            xml.description raw(image_tag(comic.comic_strips.last.comic_image_url))
          else
            xml.description "Sorry, no comic strips have been downloaded yet"
          end
          xml.pubDate comic.created_at.to_s(:rfc822)
          xml.link comic.homepage
          xml.guid comics_url
        end
      end
    end
  end
end

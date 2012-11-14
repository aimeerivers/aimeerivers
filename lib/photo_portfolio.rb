require 'xml'
require 'open-uri'

class PhotoPortfolio

  RATIOS = {
      wide: 0.441,
      big: 0.902,
      small: 0.9,
      tall: 1.84,
      extrabig: 1.363
  }

  def initialize(feed = '')
    feed = 'http://api.flickr.com/services/feeds/photoset.gne?set=72157630026922131&nsid=89953410@N00&lang=en-us&format=rss_200' if feed == ''
    content = open(feed).read
    parser = LibXML::XML::Parser.string(content)
    @doc = parser.parse
  end

  def photos
    @doc.find('//channel/item').map do |xml_object|
      Photo.new(xml_object)
    end.map(&:to_hash)
  end

  def self.arrange(photos, arrangement)
    arrangement.map do |card|
      card.map do |size|
        by_aspect_ratio = photos.sort_by{|p| (RATIOS[size] - p[:aspect_ratio]).abs}
        photos.delete(by_aspect_ratio[0]).merge({size: size})
      end
    end
  end

end

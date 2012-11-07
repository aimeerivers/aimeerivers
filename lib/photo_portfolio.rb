require 'xml'
require 'open-uri'

class PhotoPortfolio

  def initialize
    content = open('http://api.flickr.com/services/feeds/photoset.gne?set=72157630026922131&nsid=89953410@N00&lang=en-us&format=rss_200').read
    parser = LibXML::XML::Parser.string(content)
    @doc = parser.parse
  end

  def photos
    @doc.find('//channel/item').map do |xml_object|
      Photo.new(xml_object)
    end.map(&:to_hash)
  end

end

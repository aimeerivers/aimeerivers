require 'xml'
require 'open-uri'

class PhotoPortfolio

  def initialize
    content = open('http://api.flickr.com/services/feeds/photoset.gne?set=72157630026922131&nsid=89953410@N00&lang=en-us').read
    parser = LibXML::XML::Parser.string(content)
    @doc = parser.parse
  end

  def photos
    @doc.find('//atom:feed/atom:entry', 'atom:http://www.w3.org/2005/Atom').map do |xml_object|
      Photo.new(xml_object)
    end
  end

end

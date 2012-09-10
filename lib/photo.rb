class Photo

  NAMESPACE = 'atom:http://www.w3.org/2005/Atom'

  def initialize(data)
    @data = data
  end

  def title
    @data.find_first('atom:title', NAMESPACE).content
  end

  def image
    @data.find_first('atom:link[@rel="enclosure"]', NAMESPACE)['href'].sub('_b.jpg', '_z.jpg')
  end

  def link
    @data.find_first('atom:link[@rel="alternate"]', NAMESPACE)['href']
  end

end

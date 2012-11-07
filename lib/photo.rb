class Photo

  def initialize(data)
    @data = data
  end

  def title
    @data.find_first('title').content
  end

  def image
    @data.find_first('media:content')['url'].sub('_b.jpg', '_z.jpg')
  end

  def link
    @data.find_first('link').content
  end

  def width
    return @data.find_first('media:content')['width'].to_i
  end

  def height
    return @data.find_first('media:content')['height'].to_i
  end

  def pixel_area
    width * height
  end

  def to_hash
    {
      title: title,
      image: image,
      link: link,
      width: width,
      height: height,
      pixel_area: pixel_area
    }
  end

end

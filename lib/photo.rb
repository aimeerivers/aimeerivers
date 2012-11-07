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

  def to_hash
    {
      title: title,
      image: image,
      link: link
    }
  end

end

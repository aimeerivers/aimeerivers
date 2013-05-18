class Weather
  attr_accessor :city, :description, :short_description

  def initialize(json)
    @city = json['name']
    @description = json['weather'][0]['description']
    @short_description = json['weather'][0]['main']
  end

end

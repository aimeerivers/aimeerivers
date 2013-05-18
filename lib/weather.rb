class Weather
  attr_accessor :city, :description, :short_description, :temperature

  def initialize(json)
    @city = json['name']
    @description = json['weather'][0]['description']
    @short_description = json['weather'][0]['main']
    @temperature = json['main']['temp'].to_f - 273.15
  end

end

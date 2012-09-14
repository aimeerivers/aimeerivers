require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'
require 'dalli'

set :cache, Dalli::Client.new
set :cache_server, "localhost:11211"
set :enable_cache, true

Dir["lib/**/*.rb"].each {|f| require "./#{f}"}

TESTIMONIALS = [
  {
    text: "aimee has an infectious passion for her craft. Having spent many hours pairing with aimee across multiple projects, I have always enjoyed the experience, learned a lot and been able to easily contribute in a collaborative manner. I would recommend aimee as an excellent team member, developer and friend.",
    name: "Richard Patching",
    date: "April 2012"
  },
  {
    text: "We were delighted with the finished web site designed by aimee, her love for the subject was evident due to the care and consideration she showed throughout the building process, making sure our needs were paramount.",
    name: "Alan Colledge",
    date: "January 2012"
  },
  {
    text: "We hired Aimee at a key stage of our site redevelopment and her attitude and enthusiasm was key in getting our site relaunch live. Her love of web development shines through and she's always ready to go that extra mile to complete tasks on time and on budget. Aimee has worked fantastically well with members of our team and I would not hesitate to recommend her work to anyone.",
    name: "Neil McDermott",
    date: "November 2011"
  },
  {
    text: "Aimee has been an absolute delight to work with on the first phase of the Feusd Core project. She has an intimate knowledge of Ruby and is very enthusiastic about pair programming, automated testing, and retrospectives. She has a passion for producing elegant and extensible code, and is a very patient and thoughtful mentor.",
    name: "Tom Inglis",
    date: "October 2011"
  },
  {
    text: "Aimee is such a great software developer. We did some remote pairing development, and she impressed me. She's very responsive and fast when tracking down a bug or writing a feature, and produces a very good code as well. It was such a pleasure to work with her, hope to do it again soon.",
    name: "Mauricio Zaffari",
    date: "May 2011"
  },
  {
    text: "Aimee came into our company and really delivered from the start, her enthusiasm for the work, technical knowledge and her creative ability were first class. She has been a great member of the team.",
    name: "Spencer Bookatz",
    date: "May 2011"
  },
  {
    text: "I can recommend, without hesitation, Aimee's skills sets, knowledge and general all round energy to any interested party seeking a top level player on their team.",
    name: "James Griffiths",
    date: "May 2011"
  },
  {
    text: "Beyond her excellent technical skills crafting quality, Test Driven code, aimee is also a talented mentor. I would highly recommend her as a developer consultant and as an Agile mentor/coach.",
    name: "Todd Anderson",
    date: "March 2011"
  },
  {
    text: "aimee is a fantastically caring and open person, which in combination with her technical skills and grasp of methodology makes her an excellent person to work with and learn from. Teaching is a passion of aImee's and I have been deeply impressed at her care for and guidance of both her apprentices. She's also a ridiculously fast typist!",
    name: "Spencer Turner",
    date: "March 2011"
  },
  {
    text: "aimee is an excellent developer. She is highly disciplined and thorough in her approach. She learns continuously and has a talent for sharing her knowledge. aimee is committed to bringing out the best in other people. I would happily recommend her to any team.",
    name: "Steve Tooke",
    date: "March 2011"
  },
  {
    text: "I would thoroughly recommend Aimee for any role you consider. She is a committed and dedicated professional, who is highly creative, and has a high degree or expertise in the business of crafting high quality software. She is a very nice person as well, who is a pleasure to work, with and fits in well in any team environment.",
    name: "Jim Bourke",
    date: "March 2011"
  },
  {
    text: "Aimee has worked on a couple of projects for us and has always delivered a first class product. Aimee is a very conscientious developer when it comes to code quality and can be relied upon to build robust, dependable, well tested software. On numerous occasions Aimee has gone above and beyond to ensure a deadline or commitment was met. I would not hesitate in working with her again on future projects.",
    name: "Andrew Edwards",
    date: "March 2011"
  },
  {
    text: "aimee has been my mentor while working at Eden Development. Her support and encouragement helped me build up my confidence as a developer. She is an excellent developer, very focused and dedicated to the software craft and always aims at providing the best value to customers. I hope to work with aimee again in the future.",
    name: "Despo Pentara",
    date: "March 2011"
  },
  {
    text: "Aimee is a consumate professional who designed our initial website and alters our web pages on an ongoing basis. We have had deadlines and time frames which Aimee has always met, and with such an agreeable, flexible and pleasant nature, I would have no hesistation in recommending her work to anyone.",
    name: "Cathy Wallwork",
    date: "March 2011"
  },
  {
    text: "I would recommend Aimee to any software development team as a strong and solid coder. She will bring an edge of enthusiasm and fun to pretty much any project, and will naturally encourage and nurture the newer and less experienced members of the team. Hire her: you won't regret it.",
    name: "Chris Parsons",
    date: "March 2011"
  },
  {
    text: "aimee loves her craft and continuously tries to better her skills. Her focus and dedication to her customers and project work is second to none.",
    name: "Enrique Comba Riepenhausen",
    date: "March 2011"
  },
  {
    text: "What I most like about Aimee is that she cares. She cares about the clients she works with, she care about the colleagues she works with and she cares about the code she writes.",
    name: "Alberto Pe&ntilde;a Abril",
    date: "March 2011"
  }
]

configure do
  set :haml, format: :html5
end

get '/' do
  @testimonial = TESTIMONIALS.sample
  haml :index
end

get '/starbursts' do
  haml :starbursts
end

get '/photography' do
  @photos = get_photos
  haml :photography
end

get '/css/:name.css' do
  content_type 'text/css', charset: 'utf-8'
  scss :"css/#{params[:name]}"
end

def get_photos
  return PhotoPortfolio.new.photos unless settings.enable_cache
  settings.cache.set('photos', PhotoPortfolio.new.photos) if settings.cache.get('photos').nil?
  settings.cache.get('photos')
end

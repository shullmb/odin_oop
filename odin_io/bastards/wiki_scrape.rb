#Scrape Frontpage of Wikipedia

<<<<<<< HEAD
require_relative 'rubygems'
require_relative 'rest-client'
=======

require 'rubygems'
#will not function on Windows -- works on linux 
require 'rest-client'
>>>>>>> 9f48330cd0881a66d3b62581c7256e365cebc611

wiki_url = "http://en.wikipedia.org/"
wiki_local_file = "wikipage.html"

File.open(wiki_local_file, "w") do |file|
	file.write(RestClient.get(wiki_url))
end
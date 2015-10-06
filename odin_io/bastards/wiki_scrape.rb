#Scrape Frontpage of Wikipedia


require 'rubygems'
#will not function on Windows -- works on linux 
require 'rest-client'

wiki_url = "http://en.wikipedia.org/"
wiki_local_file = "wikipage.html"

File.open(wiki_local_file, "w") do |file|
	file.write(RestClient.get(wiki_url))
end
require 'httparty'

class Coursera
  include HTTParty

 base_uri 'https://api.coursera.org/api/catalog.v1/courses'
 default_params fields: "smallicon,shortDescription", q: "search"
 format :json

 def self.for term
   get("", query:{query: term})["elements"]
 end
end

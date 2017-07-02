require 'httparty'

class Coursera
  include HTTParty

  default_options.update(verify: false) # Turn off SSL verification
  base_uri 'https://api.coursera.org/api/catalog.v1/courses'
  default_params fields: "smallIcon,shortDescription", q: "search"
  format :json

  def self.for term
    response = get("", query: {query: term})
    puts response.request.last_uri.to_s
    elements = response["elements"]
    if elements
      p "Got Positive response!"
      #response
    else
      p "Got Negative response!"
    end
  end
end

p Coursera.for 'python'

# Write your code here
require 'net/http'
require 'open-uri'
require 'json'

class GetRequester
  attr_reader :url

  def initialize(url)
    @url = url
  end

  def get_response_body
    uri = URI.parse(@url)
    resopnse = Net::HTTP.get_response(uri)
    resopnse.body 
  end

  def parse_json
    programs = JSON.parse(self.get_response_body)
    programs.collect do |program|
      program
    end
  end

end
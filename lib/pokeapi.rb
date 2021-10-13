require 'net/http'

module Pokeapi
  BASE_URI = "https://pokeapi.co/api/v2"

  class Resource
    def self.request resource
      uri = URI("#{BASE_URI}/#{resource}")
      response = Net::HTTP.get_response(uri)
      JSON.parse(response.body)
    end

    def self.get params = nil
      throw "You can't call Resource#get directly" if name.demodulize == 'Resource'

      request "#{name.demodulize.downcase}/#{params}"
    end

    def self.get_all
      next_url_params = nil
      results = []

      loop do
        data = get next_url_params
        results += data["results"]

        next_url_params = if data["next"] then
                            "?#{data["next"].split("?").try(:last)}"
                          else
                            nil
                          end

        break unless next_url_params
      end

      results
    end
  end

  class Pokemon < Resource
  end
end

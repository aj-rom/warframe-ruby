# frozen_string_literal: true

require 'net/http'
require 'json'

module Warframe
  module REST
    # A request to send to the Warframe Stat API.
    class Request
      # @return [Warframe::REST::Client]
      attr_reader :client

      # @return [String]
      attr_reader :path

      # Instantiate a Request
      #
      # @param client [Warframe::REST::Client]
      # @param path [String]
      # @param klass [Warframe::Models]
      # @return [Warframe:REST:Request]
      def initialize(client, path, klass)
        @client = client
        @route = path
        @path = client.base_url + path + "?language=#{@client.language}"
        @klass = klass
      end

      # Sends an HTTP request with the attached parameters and headers.
      # Will either return the Model, or collection of Models.
      # @return [Warframe::Models, Array<[Warframe::Models]>]
      def send
        uri = URI(path)
        req = Net::HTTP::Get.new(uri)
        resp = get_response uri, req
        return_parsed resp
      end

      private

      # Returns the parsed JSON response in the form of a [Warframe::Models] or an array of [Warframe::Models]
      # @param resp [Net::HTTP.get]
      # @return [Warframe::Models, Array<[Warframe::Models]>]
      def return_parsed(resp)
        parsed = JSON.parse(resp)

        # Return Empty array if no data found.
        return [] if parsed.is_a?(Array) && parsed.empty?

        @klass.new parsed
      end

      def get_response(uri, req)
        Net::HTTP.get(uri) do |http|
          http.use_ssl = true
          http.request req
        end
      end
    end
  end
end

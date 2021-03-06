# frozen_string_literal: true

require 'warframe/models/news'
require_relative '../utils'

module Warframe
  module REST
    module API
      # API endpoint for getting information from the News route.
      #
      # {https://api.warframestat.us/pc/news Example Response}
      module News
        include Warframe::REST::Utils

        # Gets the current news data.
        # @return [Array<Warframe::Models::News>]
        def news
          get('/news', Warframe::Models::News)
        end
      end
    end
  end
end

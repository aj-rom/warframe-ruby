# frozen_string_literal: true

require 'warframe/models/invasion'
require_relative '../utils'

module Warframe
  module REST
    module API
      # API endpoint for getting information on current Invasions data.
      #
      # {https://api.warframestat.us/pc/invasions Example Response}
      module Invasions
        include Warframe::REST::Utils

        # Gets the current Invasions data.
        # @return [Array<[Warframe::Models::Invasion]>]
        def invasions
          get('/invasions', Warframe::Models::Invasion)
        end
      end
    end
  end
end

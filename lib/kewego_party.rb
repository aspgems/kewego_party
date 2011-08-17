require "kewego_party/version"

require 'api_cache'

require 'kewego_party/configuration'
require 'kewego_party/client'
require 'kewego_party/exceptions'

module KewegoParty
  extend Configuration
  class << self
    # Alias for KewegoParty::Client.new
    #
    # @return [KewegoParty::Client]
    def new(options={})
      KewegoParty::Client.new(options)
    end

    # Delegate to KewegoParty::Client.new
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private=false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end
end

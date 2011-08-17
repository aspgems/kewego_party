require 'httparty'

require 'kewego_party/cache'
require 'kewego_party/connection'
require 'kewego_party/request'

require 'kewego_party/client/app'
require 'kewego_party/client/auth'
require 'kewego_party/client/channel_list'
require 'kewego_party/client/channel'
require 'kewego_party/client/upload'
require 'kewego_party/client/video'

module KewegoParty
  class Client
    include ::HTTParty

    include KewegoParty::Cache
    include KewegoParty::Connection
    include KewegoParty::Request

    include KewegoParty::Client::App
    include KewegoParty::Client::Auth
    include KewegoParty::Client::ChannelList
    include KewegoParty::Client::Channel
    include KewegoParty::Client::Upload
    include KewegoParty::Client::Video

    attr_accessor(*(Configuration::VALID_OPTIONS_KEYS - [:app_token]))

    def initialize(options={})
      options = KewegoParty.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

    def caching_store=(store)
      @caching_store = store
      APICache.store = store
    end

    private
    def process_response(response, xml_path = [])
      raise KewegoParty::InvalidResponseException.new(path) if response.nil? || !response.key?(:kewego_response)
      
      response = response[:kewego_response]
      if response[:error]
        raise KewegoParty::ErrorResponseException.new(response[:kewego_error])
      else
        response = response[:message]
      end

      xml_path = [xml_path || []].flatten.compact
      xml_path.inject(response) do |response, path|
        raise KewegoParty::InvalidResponseException.new(path) unless response.key?(path)

        response[path]
      end
    end
  end
end
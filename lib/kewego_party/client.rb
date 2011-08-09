require 'httparty'

require 'kewego_party/connection'
require 'kewego_party/request'

require 'kewego_party/client/app'
require 'kewego_party/client/channel_list'
require 'kewego_party/client/channel'
require 'kewego_party/client/video'

module KewegoParty
  class Client
    attr_accessor(*Configuration::VALID_OPTIONS_KEYS)

    def initialize(options={})
      options = KewegoParty.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

    include ::HTTParty

    include KewegoParty::Connection
    include KewegoParty::Request

    include KewegoParty::Client::App
    include KewegoParty::Client::ChannelList
    include KewegoParty::Client::Channel
    include KewegoParty::Client::Video
  end
end
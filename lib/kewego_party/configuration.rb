module KewegoParty
  module Configuration
    VALID_OPTIONS_KEYS = [
      :api_version,
      :login,
      :password,
      :token,
      :app_token,
      :user_agent,
      :debug_output].freeze

    DEFAULT_API_VERSION  = 1
    DEFAULT_LOGIN        = nil
    DEFAULT_PASSWORD     = nil
    DEFAULT_TOKEN        = nil
    DEFAULT_APP_TOKEN    = nil
    DEFAULT_USER_AGENT   = "Kewego Ruby Gem #{KewegoParty::VERSION}".freeze
    DEFAULT_DEBUG_OUTPUT = nil

    attr_accessor(*VALID_OPTIONS_KEYS)

    def self.extended(base)
      base.reset
    end

    def configure
      yield self
    end

    def options
      VALID_OPTIONS_KEYS.inject({}){|o,k| o.merge!(k => send(k)) }
    end

    def reset
      self.api_version  = DEFAULT_API_VERSION
      self.login        = DEFAULT_LOGIN
      self.password     = DEFAULT_PASSWORD
      self.token        = DEFAULT_TOKEN
      self.app_token    = DEFAULT_APP_TOKEN
      self.user_agent   = DEFAULT_USER_AGENT
      self.debug_output = DEFAULT_DEBUG_OUTPUT
    end
  end
end
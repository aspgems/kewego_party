module KewegoParty
  module Configuration
    VALID_OPTIONS_KEYS = [
      :api_version,
      :login,
      :password,
      :token,
      :app_token,
      :caching_store,
      :debug_output,
      :user_agent].freeze

    DEFAULT_API_VERSION   = 1
    DEFAULT_LOGIN         = nil
    DEFAULT_PASSWORD      = nil
    DEFAULT_TOKEN         = nil
    DEFAULT_APP_TOKEN     = nil
    DEFAULT_CACHING_STORE = ::APICache.store
    DEFAULT_DEBUG_OUTPUT  = nil
    DEFAULT_USER_AGENT    = "Kewego Ruby Gem #{KewegoParty::VERSION}".freeze

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
      self.debug_output = DEFAULT_DEBUG_OUTPUT
      self.user_agent   = DEFAULT_USER_AGENT

      ::APICache.send(:remove_instance_variable, :@store)
      self.caching_store  = ::APICache.store
    end
  end
end
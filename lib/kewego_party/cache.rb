module KewegoParty
  module Cache

    def app_reset_app_token
      with_caching(app_token_cache_key, :cache => 0, :period => 0) do
        app_get_token
      end
    end

    def app_token
      self.app_token = with_caching(app_token_cache_key, :cache => app_token_cache_timeout, :period => 0) do
        app_get_token
      end
      @app_token
    end

    def app_token=(token)
      @app_token = token
    end

    protected
    def with_caching(key, options)
      APICache.get(key, options) do
        yield
      end
    rescue APICache::TimeoutError => err
      raise KewegoParty::TimeoutException.new
    end

    def app_token_cache_key
      'app_get_token'
    end

    def app_token_cache_timeout
      22 * 3600
    end

    def cache_fail
      raise
    end
  end
end
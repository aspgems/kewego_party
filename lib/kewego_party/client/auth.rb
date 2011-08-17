module KewegoParty
  class Client
    module Auth
      # Generates a user token needed for adding and updating data in kewego
      #
      # @param options [Hash] A customizable set of options.
      # @option options [String] :username(configuration.login). User name to login
      # @option options [String] :password(configuration.password). Password to login
      # @return [String] returns the user token
      # @see http://developers.kewego.com/documentation/auth/getauthtoken.html
      # @example receive the user token
      #   KewegoParty.auth_get_auth_token
      def auth_get_auth_token(options = {})
        options = {:appToken => app_token, :username => self.login, :password => self.password}.merge options
        response = get('/api/getAuthToken/', options, 2)
        process_response(response, [:token])
      end

      # Generates a user token needed for adding and updating data in kewego
      #
      # @param options [Hash] A customizable set of options.
      # @option options [String] :username(configuration.login). User name to login
      # @option options [String] :password(configuration.password). Password to login
      # @return [String] returns the user token
      # @see http://developers.kewego.com/documentation/auth/getauthtoken.html
      # @example receive the user token
      #   KewegoParty.auth_get_login_token
      def auth_get_login_token(options = {})
        options = {:appToken => app_token, :username => self.login, :password => self.password}.merge options
        response = get('/api/getLoginToken/', options, 2)
        process_response(response, [:token])
      end
    end
  end
end
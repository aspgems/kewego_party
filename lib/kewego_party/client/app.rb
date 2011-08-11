module KewegoParty
  class Client
    module App
      def app_get_token
        self.app_token = get("/app/getToken/", {:appKey => token}).kewego_response.message.app_token
        @app_token
      end

      def app_check_token
        get("/app/checkToken/", {:appKey => token, :appToken => app_token})
      end
    end
  end
end
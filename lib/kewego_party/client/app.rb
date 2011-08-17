module KewegoParty
  class Client
    module App
      def app_get_token
        response = get("/app/getToken/", {:appKey => token})
        self.app_token = process_response(response, [:app_token])
        @app_token
      end

      def app_check_token
        response = get("/app/checkToken/", {:appKey => token, :appToken => app_token})
        process_response(response, [:app_token])
      end
    end
  end
end
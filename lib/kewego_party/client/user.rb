module KewegoParty
  class Client
    module User

      def user_get_videos(username, options = {})
        options = {:username => username, :appToken  => app_token}.merge options
        response = get('/user/getVideos/', options)
        process_response(response, [])
      end

    end
  end
end

module KewegoParty
  class Client
    module ChannelList

      def channel_list_get_channels(lsig, options = {})
        options = {:start => 0, :max_result_per_page => 100, :lsig => lsig, :appToken  => app_token}.merge options
        get("/channelList/getChannels/", options).kewego_response.message.channels
      end

      def channel_list_get_details(lsig)
        options = {:lsig => lsig, :appToken  => app_token}
        get("/channelList/getDetails/", options).kewego_response.message
      end
    end
  end
end
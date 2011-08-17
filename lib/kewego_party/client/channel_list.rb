module KewegoParty
  class Client
    module ChannelList

      def channel_list_get_channels(lsig, options = {})
        options = {:start => 0, :max_result_per_page => 100, :lsig => lsig, :appToken  => app_token}.merge options
        response = get("/channelList/getChannels/", options)
        process_response(response, [:channels])
      end

      def channel_list_get_details(lsig)
        options = {:lsig => lsig, :appToken  => app_token}
        response = get("/channelList/getDetails/", options)
        process_response(response, [])
      end
    end
  end
end
module KewegoParty
  class Client
    module Video

      # Information related to a video
      #
      # @param sig [String] A Kewego video Identifier.
      # @param full_details [Boolean] (false) Add thumbnails in response.
      # @return [Hashie::Rash] returns the information (metadatas) related to a video.
      # @see http://developers.kewego_party.com/documentation/channel/getthumbnail.html
      # @example receive the details from a video (sig)
      #   KewegoParty.video_get_details("some_sig_identifier")
      def video_get_details(sig, full_details = false)
        options = {:sig => sig, :fullDetails => full_details, :appToken  => app_token}
        response = get("/video/getDetails/", options)
        process_response(response, [])
      end

      # Returns the stats of a video.
      #
      # @param sig [String] A Kewego video Identifier.
      # @param options [Hash] A customizable set of options.
      # @option options [String] :type (day). Possible value: day
      # @option options [Integer] :value (15). Number of days in result (from current day).
      # @return [Hashie::Rash] returns the video stat points
      # @see http://developers.kewego.com/documentation/video/getstats.html
      # @example receive the stats from a video (sig)
      #   KewegoParty.video_get_stats("some_sig_identifier")
      def video_get_stats(sig, options = {})
        options = {:type => 'day', :value => 15, :sig => sig, :appToken  => app_token}.merge options
        response = get("/video/getStats/", options)
        process_response(response, [:stats])
      end
    end
  end
end
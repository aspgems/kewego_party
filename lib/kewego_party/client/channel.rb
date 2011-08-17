module KewegoParty
  class Client
    module Channel

      def channel_get_videos(csig, options = {})
        options = {:csig => csig, :appToken  => app_token}.merge options
        response = get('/channel/getVideos/', options)
        process_response(response, [])
      end

      def channel_get_details(csig, options = {})
        options = {:csig => csig, :appToken  => app_token}.merge options
        response = get('/channel/getDetails/', options)
        process_response(response, [:channel])
      end

      # Thumbnail for a video
      #
      # @param csig [String] A Kewego channel Identifier.
      # @param options [Hash] A customizable set of options.
      # @option options [String] :size (normal) Size of the thumbnail - Possible values: small/normal/large
      # @option options [Integer] :pos (1) Position of the video in the channel
      # @option options [Integer] :index (1) index of the thumbnail - Possible values: 1/2/3
      # @return [String] A thumbnail
      # @see http://developers.kewego_party.com/documentation/channel/getthumbnail.html
      # @example receive a thumbnail from those available in the channel (csig)
      #   KewegoParty.get_thumbnail("some_csig_identifier")
      def channel_get_thumbnail(csig, options = {})
        options = {:csig => csig, :appToken  => app_token}.merge options
        get("/channel/getThumbnail/", options)
      end

      # Allows you to get the embedded code of a channel from the channel identifier (CSIG).
      #
      # @param csig [String] A Kewego channel Identifier.
      # @param language_code [String] ('es') Language of the player
      # @param options [Hash] A customizable set of options.
      # @option options [String] :player_key
      # @option options [String] :skin_key
      # @option options [Boolean] :autostart
      # @option options [String] :advertise
      # @option options [Integer] :width (400)
      # @option options [Integer] :height (300)
      # @return [String] A Player embedded code
      # @see http://developers.kewego.com/documentation/channel/getplayercode.html
      # @example get the embedded code of a channel from the channel identifier (csig)
      #   KewegoParty.get_player_code("some_csig_identifier")
      def channel_get_player_code(csig, language_code = "es", options = {})
        default_options = {:csig => csig, :appToken => app_token, :language_code => language_code}
        options = default_options.merge options

        response = get('/channel/getPlayerCode/', options)
        process_response(response, [:blog])
      end
    end
  end
end
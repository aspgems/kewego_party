module KewegoParty
  class Client
    module Upload

      # List of categories available for a video upload
      #
      # @return [Array] returns the available categories for a video upload.
      # @see http://developers.kewego.com/documentation/upload/getavailablecategories.html
      # @example receive the available categories
      #   KewegoParty.upload_get_available_categories
      def upload_get_available_categories
        options = {:appToken  => app_token}
        response = get("/upload/getAvailableCategories", options)
        process_response(response, [:categories, :category])
      end

      # Status of a video upload
      #
      # @param upload_key [String] unique key used to follow an upload, declared in uploadVideo call as X-Progress-ID
      # @return [Hashie::Rash] returns the status of the video upload
      # @see http://developers.kewego.com/documentation/upload/getuploadprogress.html
      # @example receive the status of an upload
      #   KewegoParty.upload_get_upload_progress('cd26e3d0fd21fec2589c6f7dd41078')
      def upload_get_upload_progress(upload_key)
        options = {:appToken  => app_token, :upload_key => upload_key}
        response = get("/upload/getUploadProgress", options)
        process_response(response, [])
      end
    end
  end
end
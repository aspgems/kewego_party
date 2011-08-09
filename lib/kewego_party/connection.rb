module KewegoParty
  # @private
  module Connection
    private

    def connection(authenticate=true, raw=false, version=1, force_urlencoded=true)
      case version
      when 1
        url = "http://api.kewego.com"
      when 2 # login
        url = "http://login.kewego.com"
      end

      {
        :ssl => { :verify => false },
        :url => url
      }
    end
  end
end
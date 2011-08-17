require 'kewego_party/parse_xml'

module KewegoParty
  module Request
    def delete(path, options={}, version=api_version, authenticate=true, raw=false, force_urlencoded=true)
      request(:delete, path, options, version, authenticate, raw, force_urlencoded)
    end

    def get(path, options={}, version=api_version, authenticate=true, raw=false, force_urlencoded=true)
      request(:get, path, options, version, authenticate, raw, force_urlencoded)
    end

    def patch(path, options={}, version=api_version, authenticate=true, raw=false, force_urlencoded=true)
      request(:patch, path, options, version, authenticate, raw, force_urlencoded)
    end

    def post(path, options={}, version=api_version, authenticate=true, raw=false, force_urlencoded=true)
      request(:post, path, options, version, authenticate, raw, force_urlencoded)
    end

    def put(path, options={}, version=api_version, authenticate=true, raw=false, force_urlencoded=true)
      request(:put, path, options, version, authenticate, raw, force_urlencoded)
    end

    private

    def request(method, path, options, version, authenticate, raw, force_urlencoded)
      connect_options = connection(authenticate, raw, version, force_urlencoded)

      response = self.class.send(method, connect_options[:url] + path, request_options.merge(:query => options))

      if raw
        response.body
      else
        raise_kewego_error(response.parsed_response)
        response.parsed_response
      end
    end

    def request_options
      options = {:parser => KewegoParty::ParseXml}
      options.merge!(:debug_output => debug_output) if debug_output

      options
    end

    def raise_kewego_error(response)
      raise KewegoParty::InvalidResponseException.new() if response.nil? || !response.key?(:kewego_response)

      if response[:kewego_response][:error] == "yes"
        raise KewegoParty::ErrorResponseException.new(response[:kewego_response][:kewego_error])
      end
    end
  end
end
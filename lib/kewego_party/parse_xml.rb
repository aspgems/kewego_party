require 'multi_xml'
require 'hashie/rash'

module KewegoParty
  class ParseXml < HTTParty::Parser
    def parse
      xml_parsed = ::MultiXml.parse(body)

      case xml_parsed
        when Hash
          ::Hashie::Rash.new(xml_parsed)
        when Array
          xml_parsed.map { |item| item.is_a?(Hash) ? ::Hashie::Rash.new(item) : item }
        else
          xml_parsed
      end
    end
  end
end

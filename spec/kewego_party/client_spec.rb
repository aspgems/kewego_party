# -*- encoding: utf-8 -*-
require 'spec_helper'

describe KewegoParty::Client do

  before do
    @client = KewegoParty::Client.new(:token => 'd4c804fd0f42533351aca404313d26eb')
  end

  it "should raise an exception if the response not corresponds" do
    VCR.turned_off do
      stub_request(:get, "http://api.kewego.com/app/getToken/?appKey=#{@client.token}").
          to_return(:body => fixture("app_get_auth_token.xml"), :headers => {:content_type => "text/html; charset=utf-8"})

      expect {
        @client.app_get_token
      }.to raise_error(KewegoParty::InvalidResponseException)
    end
  end
end

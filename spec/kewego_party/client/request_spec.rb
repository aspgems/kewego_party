# -*- encoding: utf-8 -*-
require 'spec_helper'

describe KewegoParty::Request do

  before do
    @client = KewegoParty::Client.new(:token => 'd4c804fd0f42533351aca404313d26eb')
  end

  it "raise an exception if the response not a kewego response" do
    VCR.turned_off do
      stub_request(:get, "http://api.kewego.com/app/getToken/?appKey=#{@client.token}").
          to_return(:body => fixture("not_kewego_response.xml"), :headers => {:content_type => "text/html; charset=utf-8"})

      expect {
        @client.app_get_token
      }.to raise_error(KewegoParty::InvalidResponseException)
    end
  end

  it "raise an exception if the response has a kewego error" do
    VCR.turned_off do
      stub_request(:get, "http://api.kewego.com/app/getToken/?appKey=#{@client.token}").
          to_return(:body => fixture("kewego_response_error.xml"), :headers => {:content_type => "text/html; charset=utf-8"})

      expect {
        @client.app_get_token
      }.to raise_error(KewegoParty::ErrorResponseException, 'appToken can not delivered')
    end
  end
end
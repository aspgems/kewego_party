# -*- encoding: utf-8 -*-
require 'spec_helper'

describe KewegoParty::Client::App do

  before do
    @client = KewegoParty::Client.new(:token => 'd4c804fd0f42533351aca404313d26eb', :debug_output => STDOUT)
  end

  it "should use the default APICache.store as caching_store" do
    @client.caching_store.should be_kind_of(APICache.store.class)
  end

  it "should cache the app_token when access" do
    VCR.turned_off do
      stub_request(:get, "http://api.kewego.com/app/getToken/?appKey=#{@client.token}").
          to_return(:body => fixture("app_get_token.xml"), :headers => {:content_type => "text/html; charset=utf-8"})

      2.times { @client.app_token }
      a_request(:get, "http://api.kewego.com/app/getToken/?appKey=#{@client.token}").should have_been_made.once
    end
  end

  it "should execute the request if reset the app_token" do
    VCR.turned_off do
      stub_request(:get, "http://api.kewego.com/app/getToken/?appKey=#{@client.token}").
          to_return(:body => fixture("app_get_token.xml"), :headers => {:content_type => "text/html; charset=utf-8"})

      @client.app_token
      @client.app_reset_app_token
      a_request(:get, "http://api.kewego.com/app/getToken/?appKey=#{@client.token}").should have_been_made.twice
    end
  end
end
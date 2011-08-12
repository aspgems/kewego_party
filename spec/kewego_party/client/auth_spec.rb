# -*- encoding: utf-8 -*-
require 'spec_helper'

describe KewegoParty::Client::Auth do

  before do
    @client = KewegoParty::Client.new(:token => 'd4c804fd0f42533351aca404313d26eb', :debug_output => STDOUT)
  end

  describe ".auth_get_auth_token" do
    it "should return a token" do
      VCR.turned_off do
        stub_request(:get, "http://api.kewego.com/app/getToken/?appKey=#{@client.token}").
            to_return(:body => fixture("app_get_token.xml"), :headers => {:content_type => "text/html; charset=utf-8"})

        stub_request(:get, "http://login.kewego.com/api/getAuthToken/?password=demo&username=test@kewego.com&appToken=#{@client.app_token}").
           to_return(:body => fixture("app_get_auth_token.xml"), :headers => {:content_type => "text/html; charset=utf-8"})

        # @client.app_get_token # Get and save the app_token
        @client.app_token = "d24267bee58313337341f46771f3eeaa64b9254856b0ff3dc6eab18718db0a5e"
        token = @client.auth_get_auth_token(:password => "demo", :username => "test@kewego.com")
        puts token.inspect
        token.should_not be_nil
      end
    end
  end

  describe ".auth_get_login_token" do
    it "should return a token" do
      VCR.turned_off do
        stub_request(:get, "http://api.kewego.com/app/getToken/?appKey=#{@client.token}").
            to_return(:body => fixture("app_get_token.xml"), :headers => {:content_type => "text/html; charset=utf-8"})

        stub_request(:get, "http://login.kewego.com/api/getLoginToken/?password=demo&username=test@kewego.com&appToken=#{@client.app_token}").
           to_return(:body => fixture("app_get_auth_token.xml"), :headers => {:content_type => "text/html; charset=utf-8"})

        # @client.app_get_token # Get and save the app_token
        @client.app_token = "d24267bee58313337341f46771f3eeaa64b9254856b0ff3dc6eab18718db0a5e"
        token = @client.auth_get_login_token(:password => "demo", :username => "test@kewego.com")
        puts token.inspect
        token.should_not be_nil
      end
    end
  end
end
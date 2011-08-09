# -*- encoding: utf-8 -*-
require 'spec_helper'

describe KewegoParty::Client::App do

  before do
    @client = KewegoParty::Client.new(:token => 'd4c804fd0f42533351aca404313d26eb')
  end

  describe ".app_get_token" do
    use_vcr_cassette "app_get_token"

    it "should return an app_token" do
      app_token = @client.app_get_token()
      app_token.should_not be_nil
    end
  end

  describe ".app_check_token" do
    use_vcr_cassette "app_check_token"

    it "should return true" do
      @client.app_get_token # Get and save the app_token
      result = @client.app_check_token()
      result.should be_true
    end
  end
end
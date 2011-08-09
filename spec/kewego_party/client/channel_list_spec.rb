# -*- encoding: utf-8 -*-
require 'spec_helper'

describe KewegoParty::Client::ChannelList do

  before do
    @client = KewegoParty::Client.new(:token => 'd4c804fd0f42533351aca404313d26eb')

    @lsig = "327982b09c3l"
  end

  describe ".get_channels" do
    use_vcr_cassette "channel_list_get_channels"

    it "should return the cannels" do
      @client.app_get_token # Get and save the app_token
      channels = @client.channel_list_get_channels(@lsig)

      channels.total_result.should == "7"
      channels.channel.should have(7).items
    end
  end

  describe ".get_details" do
    use_vcr_cassette "channel_list_get_details"

    it "should return a token" do
      @client.app_get_token # Get and save the app_token
      details = @client.channel_list_get_details(@lsig)

      details.title.should == "Todos los canales"
      details.description.should == "Todos los canales de CharHadasTv"
      details.lsig.should == @lsig
    end
  end
end
# -*- encoding: utf-8 -*-
require 'spec_helper'

describe KewegoParty::Client::Channel do

  before do
    @client = KewegoParty::Client.new(:token => 'd4c804fd0f42533351aca404313d26eb')

    @csig = "iLyROoafYVn8"
  end

  describe ".channel_get_videos" do
    use_vcr_cassette "channel_get_videos"

    pending "should return the videos of the channel" do
      @client.app_get_token # Get and save the app_token
      videos = @client.channel_get_videos(@csig)

      videos.total_results.should == "2"
    end
  end

  describe ".channel_get_player_code" do
    use_vcr_cassette "channel_get_player_code"

    it "should return the player code" do
      @client.app_get_token # Get and save the app_token
      player_code = @client.channel_get_player_code(@csig)

      player_code.should =~ /<object.*<\/object>/
    end
  end

  describe ".channel_get_details" do
    use_vcr_cassette "channel_get_details"

    it "should return the channel details" do
      @client.app_get_token # Get and save the app_token
      details = @client.channel_get_details(@csig)

      details.csig.should == @csig
      details.name.should == "Recetas"
      details.thumbnail.should == "http://tll.kewego.com/t/img/thumb_default.jpg"
      details.nbvideos.should == "2"
    end
  end

  describe ".channel_get_thumbnail" do
    use_vcr_cassette "channel_get_thumbnail"

    pending "should return the thumbnail" do
      @client.app_get_token # Get and save the app_token
      puts @client.app_token
      details = @client.channel_get_thumbnail(@csig)

      details.should == @csig
    end
  end
end
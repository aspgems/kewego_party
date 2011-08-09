# -*- encoding: utf-8 -*-
require 'spec_helper'

describe KewegoParty::Client::Video do

  before do
    @client = KewegoParty::Client.new(:token => 'd4c804fd0f42533351aca404313d26eb')

    @sig = "iLyROoaf22Mr"
  end

  describe ".video_get_details" do
    use_vcr_cassette "video_get_details"

    it "should return the video details" do
      @client.app_get_token # Get and save the app_token
      video = @client.video_get_details(@sig)

      video.thumbnails.keys.should have(3).items
    end
  end

  describe ".video_get_stats" do
    use_vcr_cassette "video_get_stats"

    it "should return the stats from 15 days" do
      @client.app_get_token # Get and save the app_token
      stats = @client.video_get_stats(@sig)

      stats.points.point.should have(15).items
    end
  end
end